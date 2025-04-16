struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract ComplexDeep {
    value: Level1;

    init() {
        self.value = Level1{ inner: Level2{ inner: Level3{ a: 5, b: true } } };
    }
}