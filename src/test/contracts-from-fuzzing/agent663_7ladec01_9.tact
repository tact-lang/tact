struct Level2 {
    z: Bool?;
    w: Int = 7;
}

struct Level1 {
    y: Level2?;
    x: Bool;
}

contract ParamComplex(
    p: Level1,
) {
}