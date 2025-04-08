struct OptStruct {
    num: Int;
    flag: Bool;
}

contract OptionalStructVar {
    optVar: OptStruct?;

    init() {
        self.optVar = null;
    }
}