struct S {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
}

contract TestContract {
    s: S;
    init() {
        self.s = S {
            a: 1,
            b: null,
            c: "abc",
            d: null
        };
    }
}