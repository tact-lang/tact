struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
    text: String;
    optionalInt: Int?;
}

contract TestContract {
    complexField: NestedStruct;

    init() {
        self.complexField = NestedStruct {
            inner: InnerStruct {
                val: 42,
                flag: true,
                text: "hello",
                optionalInt: null,
            }
        };
    }
}