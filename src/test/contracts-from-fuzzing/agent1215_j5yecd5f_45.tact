struct Level1 {
    a: Int;
    b: Int?;
}
struct Level2 {
    l1: Level1;
    l1opt: Level1?;
}
struct Level3 {
    l2: Level2;
    l2opt: Level2?;
}

contract OptionChainThree(
    p1: Level3?,
    p2: Level3?,
) {}