struct NestedStruct {
    a: Int;
    b: Bool;
    c: String?;
}

contract DeepNested {
    inner: NestedStruct;

    init() {
        self.inner = NestedStruct{
            a: 5,
            b: true,
            c: null,
        };
    }
}