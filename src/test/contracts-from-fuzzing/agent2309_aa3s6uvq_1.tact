struct DeepNested {
    level3: Level3;
}

struct Level3 {
    value: Int?;
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{ level3: Level3{ value: null } };
    }
}