struct L3 {
    d: Bool?;
    e: String?;
}

struct L2 {
    c: Int;
    nested: L3;
}

struct L1 {
    a: Int?;
    b: L2;
}

contract Test {
    foo: L1;

    init() {
        self.foo = L1{
            a: null,
            b: L2{
                c: -99,
                nested: L3{
                    d: true,
                    e: null,
                },
            },
        };
    }
}