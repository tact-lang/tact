struct NestedStruct {
    foo: Int;
    bar: String;
    baz: Bool?;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct {
            foo: 1,
            bar: "Hello",
            baz: true,
        };
    }
}