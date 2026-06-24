struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    state: NestedStruct;

    init() {
        self.state = NestedStruct{
            inner: InnerStruct{
                a: 42,
                b: true,
            },
        };
    }
}