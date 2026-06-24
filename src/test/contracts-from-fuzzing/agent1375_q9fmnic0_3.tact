struct Level3 {
    z: Int;
}

struct Level2 {
    l3: Level3;
    b: Bool;
}

struct Level1 {
    l2: Level2;
}

contract TripleNest {
    state: Level1;

    init() {
        self.state = Level1{ l2: Level2{ l3: Level3{ z: 42 }, b: false } };
    }
}