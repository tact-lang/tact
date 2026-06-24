struct Rec {
    info: String;
    value: Int;
}

contract RecDefaults {
    r1: Rec = Rec{ info: "x", value: 1 };
    r2: Rec = Rec{ info: "y", value: 2 };
    init() {}
}