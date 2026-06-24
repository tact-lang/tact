struct Level2 {
    baz: Int?;
}

struct Level1 {
    bar: Level2?;
}

contract TestContract {
    foo: Level1?;

    init() {
        self.foo = Level1{ bar: Level2{ baz: 7 } };
    }
}