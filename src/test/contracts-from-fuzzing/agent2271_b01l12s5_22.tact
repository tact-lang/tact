struct Deep {
    num: Int;
    sub: Sub;
}

struct Sub {
    flag: Bool;
    leaf: Leaf;
}

struct Leaf {
    value: Int;
}

contract ManyNestingLevels {
    s: Deep;

    init() {
        self.s = Deep{
            num: 7,
            sub: Sub{
                flag: true,
                leaf: Leaf{
                    value: 42,
                },
            },
        };
    }
}