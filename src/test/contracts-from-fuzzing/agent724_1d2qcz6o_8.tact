struct Level3 {
    foo: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{ l2: Level2{ l3: Level3{ foo: 123 } } };
    }
}