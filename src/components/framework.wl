(* Define the four types of information *)
dataDetails = "Data & Details";
obsMotivations = "Observation & Motivations";
actConsequences = "Action & Consequences";
principlesTrends = "Principles & Trends";

(* Define the cognitive steps *)
step1 = {};
step2 = {};
step3 = {};
step4 = {};

(* Define the functions for determining the step order based on type and introverted/extraverted preference *)
introverted = {"Ni", "Fi", "Ti", "Si"};
extraverted = {"Ne", "Fe", "Te", "Se"};


getStepOrder[pref_, type_] := Module[{stepOrder},
    If[pref == "I",
        stepOrder = {1, 2, 3, 4},
        stepOrder = {4, 3, 2, 1}
    ];
    If[type == "N",
        stepOrder = stepOrder /. {1 -> 1, 2 -> 3, 3 -> 2, 4 -> 4},
        stepOrder = stepOrder /. {1 -> 4, 2 -> 2, 3 -> 3, 4 -> 1}
    ];
    Return[stepOrder]
];

getCogntiveStep[] := Module[{stepOrder},
    If[pref == "I",
        stepOrder = {},
        stepOrder = {}
    ];
    Return[stepOrder]
];

(* Determine the step order for an example type *)
stepOrder = getStepOrder["E", "N"];

(* Output the ordered steps *)
orderedSteps = {step1, step2, step3, step4}[[stepOrder]];
orderedSteps


(* Define the function to determine the cognitive steps *)
CognitiveStep[personalityType_String] := Module[{steps},

If[StringTake[personalityType, 1] == "I",
    steps = {"Where", "How"};
,
    steps = {"How", "Where"};
];

steps = If[StringTake[personalityType, 2] == "JP",
            Insert[steps, "When", 1];
        ,
            Insert[steps, "When", 2];
        ];

steps
];

(* Call the function with a personality type *)
CognitiveStep["INFP"]
