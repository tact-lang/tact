struct Leaf {
    v: Int;
    o: Int?;
}

struct Mid {
    l1: Leaf;
    l2: Leaf;
    s: String;
}

struct Top {
    m1: Mid;
    m2: Mid;
    flag: Bool;
}

contract Combo {
    store: Top;

    init() {
        self.store = Top{
            m1: Mid{
                l1: Leaf{ v: 1, o: null },
                l2: Leaf{ v: 2, o: 3 },
                s: "foo"
            },
            m2: Mid{
                l1: Leaf{ v: 4, o: null },
                l2: Leaf{ v: 5, o: 6 },
                s: "bar"
            },
            flag: true
        };
    }
}
