struct Leaf {
    flag: Bool;
}

struct Middle {
    leaf: Leaf;
    count: Int;
}

contract Nested2 {
    storage: Middle;

    init() {
        self.storage = Middle{
            leaf: Leaf{
                flag: true,
            },
            count: 42,
        };
    }
}