% Define the symptoms
symptom('Flu').
symptom('Yellowish eyes and skin').
symptom('Dark color urine').
symptom('Pale bowel movement').
symptom('Fatigue').
symptom('Vomiting').
symptom('Fever').
symptom('Pain in joints').
symptom('Weakness').
symptom('Stomach Pain').

% Define the treatments
treatment('Flu', 'Drink hot water, avoid cold eatables.').
treatment('Yellowish eyes and skin', 'Put eye drops, have healthy sleep, do not strain your eyes.').
treatment('Dark color urine', 'Drink lots of water, juices, and eat fruits. Avoid alcohol consumption.').
treatment('Pale bowel movement', 'Drink lots of water and exercise regularly.').
treatment('Fatigue', 'Drink lots of water, juices, and eat fruits.').
treatment('Vomiting', 'Drink salt and water.').
treatment('Fever', 'Put a hot water cloth on head and take Crocin.').
treatment('Pain in joints', 'Apply pain killer and take Crocin.').
treatment('Weakness', 'Drink salt and water, eat fruits.').
treatment('Stomach Pain', 'Avoid outside food and eat fruits.').

% Define dynamic patient facts
:- dynamic(patient/2).

% Main loop to ask questions
ask_symptom :-
    symptom(X),
    write('Does the patient have '),
    write(X),
    write('? (yes/no): '),
    read(Response),
    assert(patient(X, Response)),
    fail.  % Continue asking questions

ask_symptom :- 
    nl,
    write('All symptoms recorded.'),
    nl.

% Disease diagnosis rules
disease(hemochromatosis) :- 
    patient('Stomach Pain', yes),
    patient('Pain in joints', yes),
    patient('Weakness', yes),
    patient('Dark color urine', yes),
    patient('Yellowish eyes and skin', yes).

disease(hepatitis_c) :-
    not(disease(hemochromatosis)),
    patient('Pain in joints', yes),
    patient('Fever', yes),
    patient('Fatigue', yes),
    patient('Vomiting', yes),
    patient('Pale bowel movement', yes).

disease(hepatitis_b) :-
    not(disease(hemochromatosis)),
    not(disease(hepatitis_c)),
    patient('Pale bowel movement', yes),
    patient('Dark color urine', yes),
    patient('Yellowish eyes and skin', yes).

disease(hepatitis_a) :-
    not(disease(hemochromatosis)),
    not(disease(hepatitis_c)),
    not(disease(hepatitis_b)),
    patient('Flu', yes),
    patient('Yellowish eyes and skin', yes).

disease(jaundice) :-
    not(disease(hepatitis_c)),
    not(disease(hepatitis_b)),
    not(disease(hepatitis_a)),
    patient('Yellowish eyes and skin', yes).

disease(flu) :-
    not(disease(hemochromatosis)),
    not(disease(hepatitis_c)),
    not(disease(hepatitis_b)),
    not(disease(hepatitis_a)),  
    patient('Flu', yes).

% Output diagnosis and treatment
output :-
    nl,
    write('Diagnosis:'),
    nl,
    possible_diseases,
    nl,
    write('Treatment Advice:'),
    nl,
    advice.

possible_diseases :-
    (disease(X),
    write('- The patient may suffer from '),
    write(X),
    nl,
    fail);
    true.  % Ensure the rule succeeds even if no diseases are found.

advice :-
    (symptom(X),
    patient(X, yes),
    treatment(X, Y),
    write('- For '),
    write(X),
    write(': '),
    write(Y),
    nl,
    fail);
    true.  % Ensure the rule succeeds even if no advice is found.
