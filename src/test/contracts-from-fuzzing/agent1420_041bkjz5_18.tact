struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2;
}

contract TestContract {
    l1: Level1 = Level1{
        l2: Level2{ l3: null }
    };
    init() {}
}