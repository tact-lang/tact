struct Point {
    x: Int = 1;
    y: Int = 2;
}

contract StructWithDefaults {
    pos: Point = Point{};
}