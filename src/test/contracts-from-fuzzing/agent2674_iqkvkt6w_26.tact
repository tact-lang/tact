struct OptStruct {
    a: Int;
    b: Bool;
}

contract TopLevelOptionalStruct {
    opt: OptStruct?;

    init() {
        self.opt = null;
    }
}