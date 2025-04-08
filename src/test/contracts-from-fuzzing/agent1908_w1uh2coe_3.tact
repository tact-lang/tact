struct Level3 {
    p: Int;
    q: Int?;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    mid: Level2;
}

contract ThreeLevelNested {
    data: Level1;

    init() {
        self.data = Level1{ mid: Level2{ inner: Level3{ p: 123, q: null } } };
    }
}