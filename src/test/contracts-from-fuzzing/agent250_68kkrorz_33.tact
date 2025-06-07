struct InnerS {
    a: Int;
}

contract OptInnerStruct {
    field: InnerS?;

    init() {
        self.field = null;
    }
}