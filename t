#!/bin/bash

qrisk 25 1 1 1 1 0 0 40 1 1 11 210 0 10 0 > c.out
QRisk.rb "{age: 25, cholesterol_ratio: 11, blood_pressure: 210, body_mass_index: 40, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out && echo matching
