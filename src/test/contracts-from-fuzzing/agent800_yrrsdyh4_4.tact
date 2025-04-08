struct Level3 {
    a: Int;
}

struct Level2 {
    l3: Level3;
    optL3: Level3?;
}

struct Level1 {
    l2: Level2;
}

contract DeepNest {
    data: Level1;
    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{a: 5},
                optL3: null,
            }
        };
    }
}