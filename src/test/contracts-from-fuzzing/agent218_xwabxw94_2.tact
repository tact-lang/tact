struct Level2 {
    x: Int;
}

struct Level1 {
    inner: Level2?;
}

contract DeepNested {
    field: Level1;

    init() {
        self.field = Level1{ inner: Level2{x: 10} };
    }
}