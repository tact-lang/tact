struct Level2 {
    x: Int;
    y: Int;
}

struct Level1 {
    id: Int;
    l2: Level2;
}

contract NestedParam(
    arg: Level1,
) {}