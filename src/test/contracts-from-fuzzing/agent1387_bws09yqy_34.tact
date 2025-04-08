struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    l3: Level3;
    c: Int;
}

struct Level1 {
    l2: Level2;
    d: Bool;
}

contract DeepLevels {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{ a: 1, b: false },
                c: 2
            },
            d: true
        };
    }
}