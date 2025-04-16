struct Weird {
    valInt: Int;
    valBoolOpt: Bool?;
    valStr: String;
    valIntOpt: Int?;
    valBool: Bool;
    valStrOpt: String?;
}

contract WeirdMix {
    w: Weird;

    init() {
        self.w = Weird {
            valInt: 5,
            valBoolOpt: null,
            valStr: "s",
            valIntOpt: null,
            valBool: false,
            valStrOpt: null,
        };
    }
}