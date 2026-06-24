struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            a: 42,
            b: false,
            c: "test"
        };
    }
}