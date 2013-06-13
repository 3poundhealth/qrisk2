#!/bin/bash

gcc -I. *.c -o qrisk
if [ $? -ne 0 ]; then
  echo "qrisk build failed" && exit 1
fi
qrisk 25 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y ruby.out c.out && echo matching #--suppress-common-lines
