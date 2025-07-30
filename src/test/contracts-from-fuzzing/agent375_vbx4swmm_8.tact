struct Leaf {
    opt1: Int?;
    opt2: String?;
}

struct Mid {
    left: Leaf;
    right: Leaf;
    optMid: Bool?;
}

struct Root {
    childA: Mid;
    childB: Mid;
    optRoot: Address?;
}

contract TestContract {
    stuff: Root;

    init() {
        self.stuff = Root{
            childA: Mid{
                left: Leaf{ opt1: null, opt2: null },
                right: Leaf{ opt1: 42, opt2: "yo" },
                optMid: true,
            },
            childB: Mid{
                left: Leaf{ opt1: -1, opt2: null },
                right: Leaf{ opt1: null, opt2: "hi" },
                optMid: null,
            },
            optRoot: null,
        };
    }

    receive() {
        let _ = self.stuff;
    }
}