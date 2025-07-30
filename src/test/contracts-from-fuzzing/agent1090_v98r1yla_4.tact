struct Level3 {
    y: Int;
}

struct Level2 {
    x: Level3;
}

struct Level1 {
    z: Level2;
}

contract FourLayers {
    d: Level1;

    init() {
        self.d = Level1{ z: Level2{ x: Level3{ y: 42 } } };
    }
}