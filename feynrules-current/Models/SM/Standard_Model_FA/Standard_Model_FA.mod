(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)
(*                                                                             *)
(*         This file has been automatically generated by FeynRules.            *)
(*                                                                             *)
(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)


FR$ModelInformation={
  ModelName->"Standard Model",
  Authors -> {"N. Christensen", "C. Duhr", "B. Fuks"},
  Version -> "1.4.7",
  Date -> "28. 09. 2016",
  Institutions -> {"Michigan State University", "Universite catholique de Louvain (CP3)", "IPHC Strasbourg / University of Strasbourg"},
  Emails -> {"neil@pa.msu.edu", "claude.duhr@uclouvain.be", "benjamin.fuks@cnrs.in2p3.fr"},
  URLs -> "http://feynrules.phys.ucl.ac.be/view/Main/StandardModel"};

FR$ClassesTranslation={};

FR$InteractionOrderPerturbativeExpansion={{QCD, 0}, {QED, 0}};

FR$GoldstoneList={S[2], S[3]};

(*     Declared indices    *)

IndexRange[ Index[Gluon] ] = NoUnfold[ Range[ 8 ] ]

IndexRange[ Index[SU2W] ] = Range[ 3 ]

IndexRange[ Index[Generation] ] = Range[ 3 ]

IndexRange[ Index[Colour] ] = NoUnfold[ Range[ 3 ] ]

IndexRange[ Index[SU2D] ] = Range[ 2 ]

(*     Declared particles    *)

M$ClassesDescription = {
V[1] == {
    SelfConjugate -> True,
    PropagatorLabel -> "a",
    PropagatorType -> Sine,
    PropagatorArrow -> None,
    Mass -> 0,
    Indices -> {} },

V[2] == {
    SelfConjugate -> True,
    PropagatorLabel -> "Z",
    PropagatorType -> Sine,
    PropagatorArrow -> None,
    Mass -> MZ,
    Indices -> {} },

V[3] == {
    SelfConjugate -> False,
    QuantumNumbers -> {Q},
    PropagatorLabel -> "W",
    PropagatorType -> Sine,
    PropagatorArrow -> Forward,
    Mass -> MW,
    Indices -> {} },

V[4] == {
    SelfConjugate -> True,
    Indices -> {Index[Gluon]},
    PropagatorLabel -> "G",
    PropagatorType -> Cycles,
    PropagatorArrow -> None,
    Mass -> 0 },

U[1] == {
    SelfConjugate -> False,
    QuantumNumbers -> {GhostNumber},
    PropagatorLabel -> "uA",
    PropagatorType -> GhostDash,
    PropagatorArrow -> Forward,
    Mass -> 0,
    Indices -> {} },

U[2] == {
    SelfConjugate -> False,
    QuantumNumbers -> {GhostNumber},
    PropagatorLabel -> "uZ",
    PropagatorType -> GhostDash,
    PropagatorArrow -> Forward,
    Mass -> MZ,
    Indices -> {} },

U[31] == {
    SelfConjugate -> False,
    QuantumNumbers -> {GhostNumber, Q},
    PropagatorLabel -> "uWp",
    PropagatorType -> GhostDash,
    PropagatorArrow -> Forward,
    Mass -> MW,
    Indices -> {} },

U[32] == {
    SelfConjugate -> False,
    QuantumNumbers -> {GhostNumber, -Q},
    PropagatorLabel -> "uWm",
    PropagatorType -> GhostDash,
    PropagatorArrow -> Forward,
    Mass -> MW,
    Indices -> {} },

U[4] == {
    SelfConjugate -> False,
    Indices -> {Index[Gluon]},
    QuantumNumbers -> {GhostNumber},
    PropagatorLabel -> "uG",
    PropagatorType -> GhostDash,
    PropagatorArrow -> Forward,
    Mass -> 0 },

F[1] == {
    Indices -> {Index[Generation]},
    SelfConjugate -> False,
    QuantumNumbers -> {LeptonNumber},
    PropagatorLabel -> "v",
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> 0 },

F[2] == {
    Indices -> {Index[Generation]},
    SelfConjugate -> False,
    QuantumNumbers -> {-Q, LeptonNumber},
    PropagatorLabel -> "l",
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> Ml },

F[3] == {
    Indices -> {Index[Generation], Index[Colour]},
    SelfConjugate -> False,
    QuantumNumbers -> {(2*Q)/3},
    PropagatorLabel -> "uq",
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> Mu },

F[4] == {
    Indices -> {Index[Generation], Index[Colour]},
    SelfConjugate -> False,
    QuantumNumbers -> {-1/3*Q},
    PropagatorLabel -> "dq",
    PropagatorType -> Straight,
    PropagatorArrow -> Forward,
    Mass -> Md },

S[1] == {
    SelfConjugate -> True,
    PropagatorLabel -> "H",
    PropagatorType -> ScalarDash,
    PropagatorArrow -> None,
    Mass -> MH,
    Indices -> {} },

S[2] == {
    SelfConjugate -> True,
    PropagatorLabel -> "Go",
    PropagatorType -> ScalarDash,
    PropagatorArrow -> None,
    Mass -> MZ,
    Indices -> {} },

S[3] == {
    SelfConjugate -> False,
    QuantumNumbers -> {Q},
    PropagatorLabel -> "GP",
    PropagatorType -> ScalarDash,
    PropagatorArrow -> None,
    Mass -> MW,
    Indices -> {} }
}


(*        Definitions       *)

GaugeXi[ V[1] ] = GaugeXi[A];
GaugeXi[ V[2] ] = GaugeXi[Z];
GaugeXi[ V[3] ] = GaugeXi[W];
GaugeXi[ V[4] ] = GaugeXi[G];
GaugeXi[ U[1] ] = GaugeXi[A];
GaugeXi[ U[2] ] = GaugeXi[Z];
GaugeXi[ U[31] ] = GaugeXi[W];
GaugeXi[ U[32] ] = GaugeXi[W];
GaugeXi[ U[4] ] = GaugeXi[G];
GaugeXi[ S[1] ] = 1;
GaugeXi[ S[2] ] = GaugeXi[Z];
GaugeXi[ S[3] ] = GaugeXi[W];

MZ[ ___ ] := MZ;
MW[ ___ ] := MW;
Ml[ 1 ] := Me;
Ml[ 2 ] := MMU;
Ml[ 3 ] := MTA;
Mu[ 1, _ ] := MU;
Mu[ 1 ] := MU;
Mu[ 2, _ ] := MC;
Mu[ 2 ] := MC;
Mu[ 3, _ ] := MT;
Mu[ 3 ] := MT;
Md[ 1, _ ] := MD;
Md[ 1 ] := MD;
Md[ 2, _ ] := MS;
Md[ 2 ] := MS;
Md[ 3, _ ] := MB;
Md[ 3 ] := MB;
MH[ ___ ] := MH;


TheLabel[ V[4, {__}] ] := TheLabel[V[4]];
TheLabel[ U[4, {__}] ] := TheLabel[U[4]];
TheLabel[ F[1, {1}] ] := "ve";
TheLabel[ F[1, {2}] ] := "vm";
TheLabel[ F[1, {3}] ] := "vt";
TheLabel[ F[2, {1}] ] := "e";
TheLabel[ F[2, {2}] ] := "mu";
TheLabel[ F[2, {3}] ] := "ta";
TheLabel[ F[3, {1, _}] ] := "u";
TheLabel[ F[3, {1}] ] := "u";
TheLabel[ F[3, {2, _}] ] := "c";
TheLabel[ F[3, {2}] ] := "c";
TheLabel[ F[3, {3, _}] ] := "t";
TheLabel[ F[3, {3}] ] := "t";
TheLabel[ F[4, {1, _}] ] := "d";
TheLabel[ F[4, {1}] ] := "d";
TheLabel[ F[4, {2, _}] ] := "s";
TheLabel[ F[4, {2}] ] := "s";
TheLabel[ F[4, {3, _}] ] := "b";
TheLabel[ F[4, {3}] ] := "b";


(*      Couplings (calculated by FeynRules)      *)

M$CouplingMatrices = {

C[ -F[2, {e1x2}] , F[2, {e2x2}] , V[1] ] == {{I*gc1*IndexDelta[e1x2, e2x2], 0}, {I*gc1*IndexDelta[e1x2, e2x2], 0}},

C[ -F[3, {e1x2, e1x3}] , F[3, {e2x2, e2x3}] , V[1] ] == {{I*gc2*IndexDelta[e1x2, e2x2]*IndexDelta[e1x3, e2x3], 0}, {I*gc2*IndexDelta[e1x2, e2x2]*IndexDelta[e1x3, e2x3], 0}},

C[ -F[4, {e1x2, e1x3}] , F[4, {e2x2, e2x3}] , V[1] ] == {{I*gc3*IndexDelta[e1x2, e2x2]*IndexDelta[e1x3, e2x3], 0}, {I*gc3*IndexDelta[e1x2, e2x2]*IndexDelta[e1x3, e2x3], 0}},

C[ -F[3, {e1x2, e1x3}] , F[3, {e2x2, e2x3}] , V[4, {e3x2}] ] == {{I*gc4*IndexDelta[e1x2, e2x2]*SUNT[e3x2, e1x3, e2x3], 0}, {I*gc4*IndexDelta[e1x2, e2x2]*SUNT[e3x2, e1x3, e2x3], 0}},

C[ -F[4, {e1x2, e1x3}] , F[4, {e2x2, e2x3}] , V[4, {e3x2}] ] == {{I*gc5*IndexDelta[e1x2, e2x2]*SUNT[e3x2, e1x3, e2x3], 0}, {I*gc5*IndexDelta[e1x2, e2x2]*SUNT[e3x2, e1x3, e2x3], 0}},

C[ -F[3, {e1x2, e1x3}] , F[4, {e2x2, e2x3}] , V[3] ] == {{I*gc6[e1x2, e2x2]*IndexDelta[e1x3, e2x3], 0}, {0, 0}},

C[ -F[4, {e1x2, e1x3}] , F[3, {e2x2, e2x3}] , -V[3] ] == {{I*gc7[e1x2, e2x2]*IndexDelta[e1x3, e2x3], 0}, {0, 0}},

C[ -F[1, {e1x2}] , F[2, {e2x2}] , V[3] ] == {{I*gc8*IndexDelta[e1x2, e2x2], 0}, {0, 0}},

C[ -F[2, {e1x2}] , F[1, {e2x2}] , -V[3] ] == {{I*gc9*IndexDelta[e1x2, e2x2], 0}, {0, 0}},

C[ -F[3, {e1x2, e1x3}] , F[3, {e2x2, e2x3}] , V[2] ] == {{I*gc10L*IndexDelta[e1x2, e2x2]*IndexDelta[e1x3, e2x3], 0}, {I*gc10R*IndexDelta[e1x2, e2x2]*IndexDelta[e1x3, e2x3], 0}},

C[ -F[4, {e1x2, e1x3}] , F[4, {e2x2, e2x3}] , V[2] ] == {{I*gc11L*IndexDelta[e1x2, e2x2]*IndexDelta[e1x3, e2x3], 0}, {I*gc11R*IndexDelta[e1x2, e2x2]*IndexDelta[e1x3, e2x3], 0}},

C[ -F[1, {e1x2}] , F[1, {e2x2}] , V[2] ] == {{I*gc12*IndexDelta[e1x2, e2x2], 0}, {0, 0}},

C[ -F[2, {e1x2}] , F[2, {e2x2}] , V[2] ] == {{I*gc13L*IndexDelta[e1x2, e2x2], 0}, {I*gc13R*IndexDelta[e1x2, e2x2], 0}}

}

(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

(* Parameter replacement lists (These lists were created by FeynRules) *)

(* FA Couplings *)

M$FACouplings = {
     gc1 -> -EL,
     gc2 -> (2*EL)/3,
     gc3 -> -1/3*EL,
     gc4 -> GS,
     gc5 -> GS,
     gc6[e1x2_, e2x2_] -> (EL*CKM[e1x2, e2x2])/(Sqrt[2]*sw),
     gc7[e1x2_, e2x2_] -> (EL*Conjugate[CKM[e2x2, e1x2]])/(Sqrt[2]*sw),
     gc8 -> EL/(Sqrt[2]*sw),
     gc9 -> EL/(Sqrt[2]*sw),
     gc10L -> (cw*EL)/(2*sw) - (EL*sw)/(6*cw),
     gc10R -> (-2*EL*sw)/(3*cw),
     gc11L -> -1/6*(EL*(3*cw^2 + sw^2))/(cw*sw),
     gc11R -> (EL*sw)/(3*cw),
     gc12 -> (EL*(cw^2 + sw^2))/(2*cw*sw),
     gc13L -> -1/2*(EL*(cw^2 - sw^2))/(cw*sw),
     gc13R -> (EL*sw)/cw};

