struct ParamSet {
    a: Int;
    b: Bool;
    c: String;
}

contract OptsStruct {
    optionalParam: ParamSet?;

    init() {
        self.optionalParam = null;
    }
}