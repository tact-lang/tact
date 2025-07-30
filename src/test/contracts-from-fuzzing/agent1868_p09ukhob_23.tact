struct Point {
    x: Int;
    y: Int;
}

struct Params {
    p: Point;
    desc: String;
}

contract MixParams(
    pr: Params,
    enabled: Bool,
    comment: String?,
) {}