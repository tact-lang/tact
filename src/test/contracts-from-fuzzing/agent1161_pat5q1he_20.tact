struct InnerStruct {
    val: Int;
}

struct MiddleStruct {
    inner: InnerStruct;
}

struct OuterStruct {
    middle: MiddleStruct;
}

contract WrappedNested {
    data: OuterStruct?;

    init() {
        self.data = null;
    }
}