struct Level4 { w: Int?; }
struct Level3 { z: Level4; }
struct Level2 { y: Level3?; }
struct Level1 { x: Level2; }

contract DeepOptionalNest {
    nested: Level1 = Level1{
        x: Level2{
            y: null,
        }
    };
}