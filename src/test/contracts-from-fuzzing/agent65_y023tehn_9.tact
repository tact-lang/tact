struct Mixed {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract Test {
    mix: Mixed;

    init() {
        self.mix = Mixed{
            intVal: 1,
            boolVal: false,
            strVal: "test",
            optInt: null,
            optBool: true,
            optStr: null,
        };
    }
}