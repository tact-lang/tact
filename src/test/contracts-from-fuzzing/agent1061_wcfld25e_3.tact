struct Deep1 { a: Int; }
struct Deep2 { d1: Deep1; b: Int; }
struct Deep3 { d2: Deep2; c: Int; }

contract Test {
    nested: Deep3;

    init() {
        self.nested = Deep3{
            d2: Deep2{
                d1: Deep1{ a: 1 },
                b: 2
            },
            c: 3
        };
    }
}