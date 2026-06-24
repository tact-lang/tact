struct Level4 {
    n: Int;
    b: Bool;
}

struct Level3 {
    l4: Level4;
    o: Bool?;
}

struct Level2 {
    l3: Level3;
    b2: Bool;
}

struct Level1 {
    l2: Level2;
    b1: Bool;
}

contract NestedOptional {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{n: 1, b: true},
                    o: true
                },
                b2: false
            },
            b1: true
        };
    }
}
