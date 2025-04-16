struct InnerStruct {
    val: Int;
}

struct OuterStruct {
    inner: InnerStruct?;
}

contract MultiNull {
    optOuter: OuterStruct?;
    optBool: Bool?;

    init() {
        self.optOuter = null;
        self.optBool = null;
    }
}
