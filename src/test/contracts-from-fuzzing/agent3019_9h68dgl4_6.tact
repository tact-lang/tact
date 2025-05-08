struct Point {
    x: Int as int64;
    y: Int as int64;
    label: String = "";
}

contract TestContract {
    origin: Point = Point{x: 0, y: 0};
    active: Bool = true;
}