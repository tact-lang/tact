struct Level3 {
    z: Int;
}

struct Level2 {
    y: Bool;
    nested: Level3;
}

struct Level1 {
    x: Int;
    nested: Level2;
}

contract TripleNested {
    storage: Level1;

    init() {
        self.storage = Level1{
            x:1,
            nested: Level2{
                y:true,
                nested: Level3{z:5},
            },
        };
    }
}