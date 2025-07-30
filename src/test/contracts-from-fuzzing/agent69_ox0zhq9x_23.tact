struct Deep {
    a: Int;
    b: Branch;
}

struct Branch {
    c: Leaf;
    d: Leaf;
}

struct Leaf {
    x: Int;
    y: Bool;
}

contract DeepChain {
    data: Deep;

    init() {
        self.data = Deep{
            a: 1,
            b: Branch{
                c: Leaf{ x: 2, y: true },
                d: Leaf{ x: 3, y: false },
            },
        };
    }
}
