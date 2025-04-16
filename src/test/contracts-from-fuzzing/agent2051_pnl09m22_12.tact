struct Level3 {
    field: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    nested: Level2;
}

contract WideNested {
    f1: Level1;
    f2: Level1;
    f3: Level1;

    init() {
        self.f1 = Level1{ nested: Level2{ inner: Level3{ field: 1 }}};
        self.f2 = Level1{ nested: Level2{ inner: Level3{ field: 2 }}};
        self.f3 = Level1{ nested: Level2{ inner: Level3{ field: 3 }}};
    }
}