struct Level3 {
    val: Int;
}

struct Level2 {
    nest: Level3;
}

struct Level1 {
    nest: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{ nest: Level2{ nest: Level3{ val: 10 } } };
    }
}