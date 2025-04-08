struct Base {
    x: Int;
}

struct Level1 {
    base: Base;
}

struct Level2 {
    l1: Level1;
}

struct Level3 {
    l2: Level2;
}

struct Level4 {
    l3: Level3;
}

struct Level5 {
    l4: Level4;
}

contract Nested5Levels {
    d: Level5;

    init() {
        self.d = Level5{ l4: Level4{ l3: Level3{ l2: Level2{ l1: Level1{ base: Base{ x:42 } } } } } };
    }
}