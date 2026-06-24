struct Level2 {
    bar: Int;
}

struct Level1 {
    foo: Level2;
}

contract DeepNested {
    field: Level1;

    init() {
        self.field = Level1{ foo: Level2{ bar: 5 } };
    }
}