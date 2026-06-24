struct Level3 {
    z: Int as uint32;
}

struct Level2 {
    l3: Level3;
    b: Bool;
}

struct Level1 {
    l2: Level2;
}

contract SerializationDeep {
    state: Level1;

    init() {
        self.state = Level1{ l2: Level2{ l3: Level3{ z: 123456 }, b: true } };
    }
}