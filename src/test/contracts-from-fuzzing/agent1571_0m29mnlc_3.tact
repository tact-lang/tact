struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Int?; // optional inside struct
}

contract TestContract {
    nested: Inner = Inner{
        a: 1,
        b: false,
        c: "",
        d: null,
    };

    init() {
        self.nested = Inner{
            a: 10,
            b: true,
            c: "abc",
            d: 999,
        };
    }
}