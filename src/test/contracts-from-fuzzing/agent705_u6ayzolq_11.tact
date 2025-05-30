struct InnerStruct {
    x: Int;
    y: Int;
}

struct OuterStruct {
    inner: InnerStruct;
    z: Int;
}

contract OptionalNestedStruct {
    data: OuterStruct?;

    init() {
        self.data = null;
    }
}
