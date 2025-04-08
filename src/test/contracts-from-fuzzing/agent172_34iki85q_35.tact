struct Point {
    x: Int;
    y: Int;
}

contract StructDefaultLiteral {
    origin: Point = Point{ x: 0, y: 0 };

    init() {}
}