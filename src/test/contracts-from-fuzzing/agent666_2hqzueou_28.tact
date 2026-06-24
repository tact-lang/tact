struct Level3 {
    z: Bool;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract TripleNest {
    top: Level1;

    init() {
        self.top = Level1{ x: Level2{ y: Level3{ z: true } } };
    }
}