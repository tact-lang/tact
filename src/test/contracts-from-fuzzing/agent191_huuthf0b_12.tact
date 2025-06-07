struct NestedWithDefaults {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    x: Int = 42;
    y: Bool = true;
}

contract TestContract {
    store: NestedWithDefaults;

    init() {
        self.store = NestedWithDefaults{
            level1: Level1{
                level2: Level2{}
            }
        };
    }
}