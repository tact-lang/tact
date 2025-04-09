struct Level3 {
    p: Bool?;
    q: Int?;
}

struct Level2 {
    l3: Level3;
    y: Int;
}

struct Level1 {
    l2: Level2;
    x: Bool;
}

contract NestedOptionalLayers {
    storage: Level1;

    init() {
        self.storage = Level1{
            l2: Level2{
                l3: Level3{ p: null, q: null },
                y: 44
            },
            x: true
        };
    }
}
