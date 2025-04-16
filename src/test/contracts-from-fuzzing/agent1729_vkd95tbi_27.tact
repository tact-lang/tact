struct OptX { x: Int?; }
struct OptY { y: Int?; }

struct BothOpt {
    first: OptX?;
    second: OptY?;
}

contract MultiNullable {
    payload: BothOpt?;
}