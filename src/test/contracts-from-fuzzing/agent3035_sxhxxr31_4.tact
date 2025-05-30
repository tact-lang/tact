struct InnerMost {
    z: Int?;
}

struct Middle {
    y: InnerMost?;
}

struct Outer {
    x: Middle?;
}

contract Test {
    point: Outer?;
}