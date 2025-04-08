struct Point {
    x: Int = 1;
    y: Int?;  // defaults to null
}

contract StructPersist {
    pos: Point = Point{};
}