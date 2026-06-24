struct Level3 {
    z: Int?;
}

struct Level2 {
    mid: Level3?;
}

struct Level1 {
    top: Level2?;
}

contract NestedParams(
    param: Level1,
) {
}