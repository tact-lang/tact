struct Level2 {
    deep: Int = 99;
}

struct Level1 {
    l2: Level2 = Level2{};
}

contract TestContract {
    nested: Level1 = Level1{};
    init() {}
    receive() {}
}