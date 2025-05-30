struct Level3 {
    val: Int;
    flag: Bool;
}

struct Level2 {
    l3: Level3;
    optL3: Level3?;
}

struct Level1 {
    l2: Level2;
    optL2: Level2?;
}

contract DeepOptionalNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{ val: 5, flag: true },
                optL3: null
            },
            optL2: null
        };
    }
}