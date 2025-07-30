struct Level2 {
    z: Int;
}

struct Level1 {
    y: Level2;
}

struct Level0 {
    x: Level1;
}

contract DeepNestedStruct {
    root: Level0;

    init() {
        self.root = Level0{ x: Level1{ y: Level2{ z: 42 } } };
    }
}