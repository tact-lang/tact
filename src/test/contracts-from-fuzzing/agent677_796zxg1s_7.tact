struct Level3 { z: Int; }
struct Level2 { y: Level3; }
struct Level1 { x: Level2; }

contract DeepOpt {
    nested: Level1?;

    init() {
        self.nested = null;
    }
}