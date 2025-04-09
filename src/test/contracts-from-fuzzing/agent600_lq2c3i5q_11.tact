struct Level3 { z: Int; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract ChainDeep {
    deep: Level1;

    init() {
        self.deep = Level1{ l2: Level2{ l3: Level3{ z: 7 } } };
    }
}