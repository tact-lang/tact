struct Leaf1 { a: Int; }
struct Leaf2 { b: Bool; }
struct Mid {
    l1: Leaf1;
    l2: Leaf2;
}

struct Top {
    m: Mid;
    optMid: Mid?;
}

contract StructNestOpt {
    s: Top;

    init() {
        self.s = Top{
            m: Mid{
                l1: Leaf1{a:1},
                l2: Leaf2{b:true},
            },
            optMid: null,
        };
    }
}