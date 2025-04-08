struct Level3 { x: Int?; }

struct Level2 { l3: Level3; y: Int; }

struct Level1 { l2: Level2; z: Int?; }

contract OptionalDeep {
    field: Level1;

    init() {
        self.field = Level1{
            l2: Level2{ l3: Level3{x:null}, y:1 },
            z:null
        };
    }
}