struct NestedStruct {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            a: 42,
            b: true,
            c: "test",
        };
    }
}