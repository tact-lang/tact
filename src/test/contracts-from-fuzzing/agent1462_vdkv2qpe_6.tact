struct Level3 {
    z: Bool;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract DeepNestDemo {
    deep: Level1;

    init() {
        self.deep = Level1{ x: Level2{ y: Level3{ z: true } } };
    }
}