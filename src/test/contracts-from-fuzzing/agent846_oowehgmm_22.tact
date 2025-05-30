struct FlatOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Bool?;
    h: Bool?;
    i: Address?;
}

contract Test {
    foo: FlatOpt;

    init() {
        self.foo = FlatOpt{
            a: null, b: 1, c: null, d: 4, e: null, f: 6, g: true, h: null, i: null
        };
    }
}