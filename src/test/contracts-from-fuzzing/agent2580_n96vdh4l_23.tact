struct First {
    a: Int;
}

struct Second {
    b: First;
    c: Int;
}

struct Third {
    d: Second;
    e: Bool;
}

contract ChainNesting {
    z: Third;
    init() {
        self.z = Third{
            d: Second{
                b: First{ a: 1 },
                c: 2
            },
            e: false
        };
    }
}