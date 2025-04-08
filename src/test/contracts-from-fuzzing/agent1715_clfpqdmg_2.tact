struct NestedStruct {
    val1: Int;
    val2: String;
}

struct Wrapper {
    inner: NestedStruct;
    optInner: NestedStruct?;
}

contract ComplexStorage {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: NestedStruct{ val1: 1, val2: "test" },
            optInner: null,
        };
    }
}