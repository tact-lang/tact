struct Leaf {
    a: Int as uint4;
    b: Bool;
    c: String?;
}

struct Mid {
    optLeaf: Leaf?;
    num: Int as uint32;
}

contract Test {
    val: Mid;
    init() {
        self.val = Mid{
            optLeaf: Leaf{
                a: 9,
                b: true,
                c: null,
            },
            num: 1024,
        };
    }
}
