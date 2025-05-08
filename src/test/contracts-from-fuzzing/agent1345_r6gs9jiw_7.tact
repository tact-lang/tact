struct Level3 {
    value: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepFieldAccess {
    store: Level1;

    init() {
        self.store = Level1{
            nested: Level2{
                nested: Level3{ value: 123 }
            }
        };
    }
}