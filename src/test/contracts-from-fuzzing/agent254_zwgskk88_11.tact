struct Level2 {
    x: Int = 1;
    y: Int? = null;
}

struct Level1 {
    foo: Int = 5;
    bar: Level2 = Level2{};
}

contract TestContract {
    nested: Level1 = Level1{};
    receive() {}
}