struct Level3 {
    val: Int = 42;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    deeper: Level2;
}

contract TestContract {
    root: Level1 = Level1{deeper: Level2{nested: Level3{val: 42}}};
}