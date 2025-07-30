struct Level3 {
    val: Int;
}

struct Level2 {
    l3: Level3;
    optStr: String?;
}

struct Level1 {
    l2: Level2;
    flag: Bool;
}

contract DeepNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{ val: 42 },
                optStr: null
            },
            flag: false
        };
    }
}
