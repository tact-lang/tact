struct Level3 {
    leaf: Int;
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
        self.nested = Level1{ l2: Level2{ l3: Level3{ leaf: 123 } } };
    }
}