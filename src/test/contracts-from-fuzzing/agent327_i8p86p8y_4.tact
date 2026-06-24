struct Level3 {
    d: Int;
}

struct Level2 {
    c: Level3;
}

struct Level1 {
    b: Level2;
}

contract NestTest {
    a: Level1 = Level1{ b: Level2{ c: Level3{ d: 999 } } };
    init() {}
}