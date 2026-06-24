struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: String?;
    g: Bool?;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress(),
            e: null,
            f: null,
            g: null
        };
    }
}