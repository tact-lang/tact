struct Level3 {
    x: Int?;
    y: Int;
}

struct Level2 {
    l3: Level3;
    k: Int?;
}

struct Level1 {
    l2: Level2;
    z: Int;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{ x: null, y: 2 },
                k: null
            },
            z: 1
        };
    }
}