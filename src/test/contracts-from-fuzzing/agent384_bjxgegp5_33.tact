struct NestedOptionalInner {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int?;
    y: Int?;
}

contract NestedOptionalInnerContract {
    s: NestedOptionalInner = NestedOptionalInner{inner: null};

    init() {
        self.s.inner = InnerStruct{x: 10, y: null};
    }
}