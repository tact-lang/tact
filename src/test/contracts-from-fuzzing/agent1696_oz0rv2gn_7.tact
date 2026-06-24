struct Level1 { x: Int; } 
struct Level2 { l1: Level1; y: Int; }
struct Level3 { l2: Level2; z: Int; }

contract DeepNest {
    field: Level3 = Level3{
        l2: Level2{l1: Level1{x:1}, y:2},
        z:3
    };
    init() {}
}
