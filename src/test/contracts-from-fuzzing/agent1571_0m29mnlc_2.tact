struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    nested: Inner = Inner{
        a: 0,
        b: false,
        c: "",
    };

    init() {
        self.nested = Inner{
            a: 42,
            b: true,
            c: "hello",
        };
    }
}