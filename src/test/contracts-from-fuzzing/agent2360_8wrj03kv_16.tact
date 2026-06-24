// Contract with nested composite optional, multi-level
struct Level3 { z: Int; }
struct Level2 { y: Level3?; }
struct Level1 { x: Level2?; }

contract DeepOptChain {
    s: Level1;
    init() {
        self.s = Level1{ x: Level2{ y: null } };
    }
}