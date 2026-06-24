struct Point { x: Int; y: Int; }

struct Params {
    coord: Point;
    label: String?;
}

contract ParamTest(
    id: Int,
    info: Params?,
    flag: Bool,
) {}
