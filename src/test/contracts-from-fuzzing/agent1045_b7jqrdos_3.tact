struct Level2 {
    b: Int = 11;
    c: Bool = true;
}

struct Level1 {
    a: Level2;
    d: Int = 5;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{ a: Level2{ b: 99, c: false }, d: 22 };
    }

    receive() {
        self.nested = Level1{ a: Level2{ b: 1, c: true }, d: 2 };
    }
}