/* 
 * Copyright 2013 ClinRisk Ltd.
 * 
 * This file is part of QRISK2-2013 (http://qrisk.org, http://svn.clinrisk.co.uk/opensource/qrisk2).
 * 
 * QRISK2-2013 is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * QRISK2-2013 is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with QRISK2-2013.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * The initial version of this file, to be found at http://svn.clinrisk.co.uk/opensource/qrisk2, faithfully implements QRISK2-2013.
 * We have released this code under the GNU Lesser General Public License to enable others to implement the algorithm faithfully.
 * However, the nature of the GNU Lesser General Public License is such that we cannot prevent, for example, someone accidentally 
 * altering the coefficients, getting the inputs wrong, or just poor programming.
 * We stress, therefore, that it is the responsibility of the end user to check that the source that they receive produces the same results as the original code posted at http://svn.clinrisk.co.uk/opensource/qrisk2.
 * Inaccurate implementations of risk scores can lead to wrong patients being given the wrong treatment.
 * 
 * This file has been auto-generated.
 * XML source: Q77_qrisk2_2013_0.xml
 * STATA dta time stamp: 16 Nov 2012 22:10
 * Header file create date: Wed  8 May 2013 07:41:31 BST
 */

double cvd_female(
int age,int b_AF,int b_ra,int b_renal,int b_treatedhyp,int b_type1,int b_type2,double bmi,int ethrisk,int fh_cvd,double rati,double sbp,int smoke_cat,int surv,double town,int *error,char *errorBuf,int errorBufSize,int debug
);
