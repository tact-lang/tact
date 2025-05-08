struct Point {
    x: Int = 0;
    y: Int = 0;
}

contract StructDefaultField {
    pos: Point = Point{};
}