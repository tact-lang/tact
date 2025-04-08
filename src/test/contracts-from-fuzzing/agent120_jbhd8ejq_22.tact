struct Point {
    x: Int;
    y: Int;
}

struct OptionalPoint {
    point: Point?;
}

contract Test {
    field: OptionalPoint = OptionalPoint{
        point: Point{x:10, y:20},
    };
}