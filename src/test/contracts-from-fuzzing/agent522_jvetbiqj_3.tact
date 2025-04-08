struct Level2 {
    val: Int;
}

struct Level1 {
    inner: Level2;
}

contract DeepNestedField {
    nested: Level1;

    init() {
        self.nested = Level1{
            inner: Level2{ val: 99 },
        };
    }
}