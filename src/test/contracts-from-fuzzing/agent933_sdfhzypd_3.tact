struct Level3 {
    z: Int;
}

struct Level2 {
    mid: Level3?;
}

struct Level1 {
    top: Level2;
}

contract Test {
    nested: Level1;
    init() {
        self.nested = Level1{ top: Level2{ mid: Level3{ z: 99 } } };
    }
}