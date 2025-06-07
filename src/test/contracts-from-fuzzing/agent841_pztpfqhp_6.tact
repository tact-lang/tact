struct Leaf {
    x: Int;
}

struct Mid {
    a: Leaf;
    b: Leaf;
}

struct High {
    m1: Mid;
    m2: Mid;
}

contract Nest3 {
    stored: High;
    init() {
        self.stored = High{
            m1: Mid{a: Leaf{x:1}, b:Leaf{x:2}},
            m2: Mid{a: Leaf{x:3}, b:Leaf{x:4}}
        };
    }
}
