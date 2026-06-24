struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestDeepNested {
    nestedStruct: Inner;

    init() {
        self.nestedStruct = Inner{
            a: 123,
            b: true,
            c: "nested",
        };
    }
}