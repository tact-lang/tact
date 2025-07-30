struct DeepNested {
    x: Level2;
}

struct Level2 {
    y: Level3;
}

struct Level3 {
    z: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{ x: Level2{ y: Level3{ z: 42 } } };
    }
}