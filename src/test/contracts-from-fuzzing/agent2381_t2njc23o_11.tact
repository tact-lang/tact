struct Level3 {
    v: Int = 7;
}

struct Level2 {
    inner: Level3 = Level3{};
}

struct Level1 {
    mid: Level2 = Level2{};
}

contract TestContract {
    root: Level1 = Level1{ mid: Level2{ inner: Level3{ v: 123 } } };

    init() {}
}