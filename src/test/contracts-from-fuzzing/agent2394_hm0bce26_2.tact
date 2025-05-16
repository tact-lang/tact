struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract StructNested {
    nested: Inner;

    init() {
        self.nested = Inner{
            a: 123,
            b: false,
            c: "ok"
        };
    }
}
