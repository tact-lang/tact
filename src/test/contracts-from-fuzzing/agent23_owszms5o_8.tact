struct Level4 { z: Int?; }
struct Level3 { l4: Level4; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract DeepNest {
    root: Level1 = Level1{ l2: Level2{ l3: Level3{ l4: Level4{ z: null } } } };

    init() {
        self.root = Level1{ l2: Level2{ l3: Level3{ l4: Level4{ z: 777 } } } };
    }
}