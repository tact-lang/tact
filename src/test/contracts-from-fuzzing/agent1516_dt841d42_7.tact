struct Level4 {
    w: Int;
}

struct Level3 {
    z: Level4;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract Test {
    data: Level1;
    init() {
        self.data = Level1{ x: Level2{ y: Level3{ z: Level4{ w: 42 } } } };
    }
}