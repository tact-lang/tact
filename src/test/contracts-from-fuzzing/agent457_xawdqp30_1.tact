struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract DeepOptionals {
    optStruct: Nested?;
    valOpt: Int?;
    flagOpt: Bool?;

    init() {
        self.optStruct = null;
        self.valOpt = null;
        self.flagOpt = null;
    }
}