struct Level3 {
    leaf: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeeplyNested {
    field: Level1 = Level1{ inner: Level2{ inner: Level3{ leaf: 42 } } };

    init() {
        self.field = Level1{ inner: Level2 { inner: Level3 { leaf: 777 } } };
    }
}