struct Rec {
    a: Int?;
    b: Int;
}

contract DefaultsOpt {
    s: Rec = Rec{a: null, b:42};
}