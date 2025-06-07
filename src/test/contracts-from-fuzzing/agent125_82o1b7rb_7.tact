struct OptionalNested {
    nested: DeepNested?;
}

struct DeepNested {
    inner: Level2;
}

struct Level2 {
    value: Int;
}

contract TestContract {
    storage: OptionalNested;
    init() {
        self.storage = OptionalNested{
            nested: DeepNested{ inner: Level2{ value: 99 } }
        };
    }
}