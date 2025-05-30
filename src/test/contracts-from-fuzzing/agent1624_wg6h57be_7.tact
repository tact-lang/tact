struct Level3 { v3: Int; }

struct Level2 { v2: Level3; }

struct Level1 { v1: Level2; }

contract DeepNestedStruct {
    data: Level1;

    init() {
        self.data = Level1{ v1: Level2{ v2: Level3{ v3: 999 } } };
    }
}