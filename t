#!/bin/bash -e

trap 'echo -e "\n[32m$OP[31m failed[\n35m"; cat diff.out; echo -e "[0m"' int term exit

rm -f *.out

OP="qrisk male build"
gcc -I. utils.c Q77_qrisk2_2013_1.c Q77_qrisk2_2013_1_commandLine.c -o qriskm > diff.out

OP="qrisk female build"
gcc -I. utils.c Q77_qrisk2_2013_0.c Q77_qrisk2_2013_0_commandLine.c -o qriskf > diff.out

#male tests

OP="male male base options all booleans true"
qriskm 25 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male age test"
qriskm 84 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 84, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male cholesterol test"
qriskm 25 1 1 1 1 0 1 25 1 1 4 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 4, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male diabetes none"
qriskm 25 1 1 1 1 0 0 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :none, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male diabetes type 1"
qriskm 25 1 1 1 1 1 0 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male diabetes type 2"
qriskm 25 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male non smoker"
qriskm 25 1 1 1 1 1 0 25 1 1 11 120 0 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :non, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male ex smoker"
qriskm 25 1 1 1 1 1 0 25 1 1 11 120 1 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :ex, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out


OP="male light smoker"
qriskm 25 1 1 1 1 1 0 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male moderate smoker"
qriskm 25 1 1 1 1 1 0 25 1 1 11 120 3 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :moderate, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male heavy smoker"
qriskm 25 1 1 1 1 1 0 25 1 1 11 120 4 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :heavy, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male ethnicity white"
qriskm 25 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :white, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male ethnicity indian"
qriskm 25 1 1 1 1 0 1 25 2 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :indian, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male ethnicity pakistani"
qriskm 25 1 1 1 1 0 1 25 3 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :pakistani, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male ethnicity bangladeshi"
qriskm 25 1 1 1 1 0 1 25 4 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :bangladeshi, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male ethnicity other_asian"
qriskm 25 1 1 1 1 0 1 25 5 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :other_asian, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male ethnicity black_caribbean"
qriskm 25 1 1 1 1 0 1 25 6 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :black_caribbean, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male ethnicity black_african"
qriskm 25 1 1 1 1 0 1 25 7 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :black_african, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male ethnicity chinese"
qriskm 25 1 1 1 1 0 1 25 8 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :chinese, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="male ethnicity other"
qriskm 25 1 1 1 1 0 1 25 9 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :male, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :other, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

#female tests

OP="female base options all booleans true"
qriskf 25 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female age test"
qriskf 84 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 84, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female cholesterol test"
qriskf 25 1 1 1 1 0 1 25 1 1 4 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 4, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female diabetes none"
qriskf 25 1 1 1 1 0 0 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :none, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female diabetes type 1"
qriskf 25 1 1 1 1 1 0 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female diabetes type 2"
qriskf 25 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female non smoker"
qriskf 25 1 1 1 1 1 0 25 1 1 11 120 0 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :non, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female ex smoker"
qriskf 25 1 1 1 1 1 0 25 1 1 11 120 1 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :ex, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out


OP="female light smoker"
qriskf 25 1 1 1 1 1 0 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :light, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female moderate smoker"
qriskf 25 1 1 1 1 1 0 25 1 1 11 120 3 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :moderate, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female heavy smoker"
qriskf 25 1 1 1 1 1 0 25 1 1 11 120 4 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_1, smoker: :heavy, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female ethnicity white"
qriskf 25 1 1 1 1 0 1 25 1 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :white, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female ethnicity indian"
qriskf 25 1 1 1 1 0 1 25 2 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :indian, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female ethnicity pakistani"
qriskf 25 1 1 1 1 0 1 25 3 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :pakistani, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female ethnicity bangladeshi"
qriskf 25 1 1 1 1 0 1 25 4 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :bangladeshi, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female ethnicity other_asian"
qriskf 25 1 1 1 1 0 1 25 5 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :other_asian, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female ethnicity black_caribbean"
qriskf 25 1 1 1 1 0 1 25 6 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :black_caribbean, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female ethnicity black_african"
qriskf 25 1 1 1 1 0 1 25 7 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :black_african, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female ethnicity chinese"
qriskf 25 1 1 1 1 0 1 25 8 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :chinese, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

OP="female ethnicity other"
qriskf 25 1 1 1 1 0 1 25 9 1 11 120 2 10 0 1 > c.out || true
QRisk.rb "{gender: :female, age: 25, cholesterol_ratio: 11, blood_pressure: 120, body_mass_index: 25, atrial_fibrillation: true, blood_pressure_treatment: true, heart_diseased_relative: true, kidney_disease: true, rheumatoid_arthritis: true, diabetes: :type_2, smoker: :light, ethnicity: :other, internal_debug: true}" > ruby.out
diff -y --suppress-common-lines ruby.out c.out > diff.out

trap - int term exit
rm -f *.out
echo -e "];All Tests Passed!\a[32mAll Tests Passed[36m!![0m"

