struct Level3 {
    x: Int = 3;
}

struct Level2 {
    y: Int = 2;
    l3: Level3;
}

struct Level1 {
    z: Int = 1;
    l2: Level2;
}

contract MixedDeepWide {
    nested: Level1;

    init() {
        self.nested = Level1{
            z: 100,
            l2: Level2{
                y: 200,
                l3: Level3{x: 300}
            }
        };
    }
}
