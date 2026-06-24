struct OptionalDeeplyNested {
    l1: Level1?;
}

struct Level1 {
    l2: Level2?;
}

struct Level2 {
    l3: Level3?;
}

struct Level3 {
    value: Int?;
}

contract TestContract {
    state: OptionalDeeplyNested;

    init() {
        self.state = OptionalDeeplyNested{ l1: null };
    }
}