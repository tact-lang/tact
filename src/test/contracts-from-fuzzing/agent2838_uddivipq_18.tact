struct Top {
    a: Int;
    b: Mid;
}

struct Mid {
    x: Int?;
    y: Leaf;
}

struct Leaf {
    flag: Bool?;
    text: String?;
}

contract ComplexChain {
    s: Top;

    init() {
        self.s = Top {
            a: 7,
            b: Mid {
                x: null,
                y: Leaf {
                    flag: null,
                    text: null
                }
            }
        };
    }
}