struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            a: 12,
            b: true,
            c: "hi",
        };
    }
}
