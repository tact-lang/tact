// deeply nested optional contract param
struct LevelX {
    a: Int?;
    b: Bool?;
}

struct LevelY {
    x: LevelX?;
}

contract DeepParamOptional(
    field: LevelY?,
    num: Int
) {
    receive() {}
}