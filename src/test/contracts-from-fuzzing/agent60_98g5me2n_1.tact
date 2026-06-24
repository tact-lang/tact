struct NestedStruct {
    value: Int;
    flag: Bool;
}

contract SimpleNested {
    inner: NestedStruct;

    init() {
        self.inner = NestedStruct{
            value: 42,
            flag: true,
        };
    }
}