struct NestedStruct {
    val1: Int;
    val2: Bool;
}

struct ContainsNested {
    inner: NestedStruct;
    flag: Bool;
}

contract TestNested {
    data: ContainsNested;

    init() {
        self.data = ContainsNested{
            inner: NestedStruct{
                val1: 42,
                val2: true,
            },
            flag: false,
        };
    }
}
