struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
    val3: Slice;
    val4: String;
    nestedOpt: Bool?;
}

contract TestContract {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{
            inner: InnerStruct{
                val1: 42,
                val2: true,
                val3: emptyCell().asSlice(),
                val4: "hi",
                nestedOpt: null,
            }
        };
    }
}