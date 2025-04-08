struct Level3 {
    c: Int? = null;
}

struct Level2 {
    b: Int;
    inner: Level3 = Level3{};
}

struct Level1 {
    a: Int = 7;
    inner2: Level2;
}

contract TestContract {
    nested: Level1 = Level1{ inner2: Level2{ b: 5 } };
}