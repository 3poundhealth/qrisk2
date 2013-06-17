#!/bin/bash -e

trap 'echo -e "\n[32m$OP[31m failed[\n35m"; cat diff.out; echo -e "[0m"' int term exit

rm -f *.out

OP="qrisk build"
gcc -I. *.c -o qrisk 2> diff.out

OP="base options all booleans true"
qrisk 25 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="age test"
qrisk 84 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 84, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="cholesterol test"
qrisk 25 1 1 1 1 0 1 25 1 1 4 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 4, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="diabetes none"
qrisk 25 1 1 1 1 0 0 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :none, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="diabetes type 1"
qrisk 25 1 1 1 1 1 0 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="diabetes type 2"
qrisk 25 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="non smoker"
qrisk 25 1 1 1 1 1 0 25 1 1 11 120 0 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :non, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="ex smoker"
qrisk 25 1 1 1 1 1 0 25 1 1 11 120 1 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :ex, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out


OP="light smoker"
qrisk 25 1 1 1 1 1 0 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="moderate smoker"
qrisk 25 1 1 1 1 1 0 25 1 1 11 120 3 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :moderate, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="heavy smoker"
qrisk 25 1 1 1 1 1 0 25 1 1 11 120 4 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :heavy, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="ethnicity white"
qrisk 25 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :white, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="ethnicity indian"
qrisk 25 1 1 1 1 0 1 25 2 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :indian, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="ethnicity pakistani"
qrisk 25 1 1 1 1 0 1 25 3 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :pakistani, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="ethnicity bangladeshi"
qrisk 25 1 1 1 1 0 1 25 4 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :bangladeshi, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="ethnicity other_asian"
qrisk 25 1 1 1 1 0 1 25 5 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :other_asian, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="ethnicity black_caribbean"
qrisk 25 1 1 1 1 0 1 25 6 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :black_caribbean, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="ethnicity black_african"
qrisk 25 1 1 1 1 0 1 25 7 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :black_african, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="ethnicity chinese"
qrisk 25 1 1 1 1 0 1 25 8 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :chinese, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="ethnicity other"
qrisk 25 1 1 1 1 0 1 25 9 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :other, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out


trap - int term exit
rm -f *.out
echo -e "];All Tests Passed!\a[32mAll Tests Passed[36m!![0m"

