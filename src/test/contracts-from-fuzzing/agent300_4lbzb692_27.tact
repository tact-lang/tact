struct Level2 {
    n: String = "";
}

struct Level1 {
    l2: Level2?;
}

contract Test {
    l1: Level1?;
}