struct SomeTypes {
    boolVal: Bool;
    stringVal: String?;
}

contract OptMix {
    optInt: Int?;
    nested: SomeTypes?;
    norm: Int;

    init() {
        self.optInt = null;
        self.nested = null;
        self.norm = 1;
    }
}