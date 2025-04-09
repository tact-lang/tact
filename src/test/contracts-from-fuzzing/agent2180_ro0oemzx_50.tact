struct Level3 {
    v: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    nested: Level2;
}

contract ParamNested(
    data: Level1,
) {}