struct DeepNested {
    l1: Level1;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    val: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{ l1: Level1{ l2: Level2{ l3: Level3{ val: 42 } } } };
    }
}