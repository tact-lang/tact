struct Level3 {
    x: Int;
    y: Bool?;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNest {
    field: Level1;

    init() {
        self.field = Level1{
            l2: Level2{
                l3a: Level3{ x: 7, y: true },
                l3b: Level3{ x: 8, y: null }
            }
        };
    }

    receive() {
        let _ = self.field.l2.l3a.y;
    }
}