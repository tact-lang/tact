struct LevelOne {
    a: Int = 10;
}

struct LevelTwo {
    b: Int = 20;
    inner: LevelOne? = null;
}

struct LevelThree {
    c: Int = 30;
    middle: LevelTwo = LevelTwo{};
}

contract VeryDeepNest {
    deep: LevelThree = LevelThree{};
    init() {}
}