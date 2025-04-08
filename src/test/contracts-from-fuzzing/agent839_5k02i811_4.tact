struct Level3 {
    z: Bool;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract DeeplyNestedStruct {
    data: Level1;
    init() {
        self.data = Level1{ x: Level2{ y: Level3{ z: true } } };
    }
}