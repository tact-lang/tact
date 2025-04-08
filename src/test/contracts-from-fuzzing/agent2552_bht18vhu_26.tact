struct Level1 {
    a: Int?;
    b: Bool = true;
}

struct Level2 {
    l1: Level1?;
    val: String = "test";
}

contract ComboDeep {
    stuff: Level2?;
}