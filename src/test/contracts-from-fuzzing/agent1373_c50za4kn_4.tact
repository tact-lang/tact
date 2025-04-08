struct Nested {
    x: Int;
}

struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: Nested?;
}

contract Test {
    stuff: ManyOptionals;

    init() {
        self.stuff = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}