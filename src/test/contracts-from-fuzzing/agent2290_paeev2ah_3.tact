struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool?;
    c: Address;
    d: ChildStruct;
}

struct ChildStruct {
    x: Int?;
    y: String;
}

contract Test3 {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            inner: InnerStruct{
                a: 1,
                b: null,
                c: myAddress(),
                d: ChildStruct{
                    x: null,
                    y: "nested"
                }
            }
        };
    }
}