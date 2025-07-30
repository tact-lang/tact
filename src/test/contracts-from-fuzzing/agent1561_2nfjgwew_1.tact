struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                a: 42,
                b: true,
                c: "hello"
            }
        };
    }
}