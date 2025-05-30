struct Deep {
    a: Int;
    b: Bool;
    c: String;
}

struct Nested {
    d: Deep;
    e: Deep;
}

contract DoubleNested {
    n: Nested;
    init() {
        self.n = Nested{
            d: Deep{a:1, b:true, c:"a"},
            e: Deep{a:2, b:false, c:"b"}
        };
    }
}
