struct DeepNested {
    id: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    nested: NestedStruct;
}

struct NestedStruct {
    big: BigStruct;
}

struct BigStruct {
    amount: Int;
    active: Bool;
    note: String;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            id: 1,
            inner: InnerStruct{
                flag: true,
                nested: NestedStruct{
                    big: BigStruct{
                        amount: 42,
                        active: false,
                        note: "OK",
                    }
                }
            }
        };
    }
}