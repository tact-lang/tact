struct Level2 {
    c: Int = 10;
    d: Bool?;
}

struct Level1 {
    a: Int = 5;
    b: Level2;
}

contract NestedTest {
    persist: Level1 = Level1{ b: Level2{} };
    init() {}
}