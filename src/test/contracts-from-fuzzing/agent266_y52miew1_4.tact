struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract DeepChain {
    ch: Level1;

    init() {
        self.ch = Level1{ x: Level2{ y: Level3{ z: 42 } } };
    }
}