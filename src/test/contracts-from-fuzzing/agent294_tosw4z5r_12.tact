struct Level2 {
    c: Int?;
}

struct Level1 {
    b: Level2?;
}

contract ParamsNested(
    a: Level1?,
    flag: Bool?
) {}
