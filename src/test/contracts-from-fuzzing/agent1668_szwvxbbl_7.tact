struct OptionalNested {
    maybePoint: Point?;
}

struct Point {
    x: Int;
    y: Int;
}

contract Test {
    field: OptionalNested;
    init() {
        self.field = OptionalNested{
            maybePoint: Point{ x: 1, y: 2 }
        };
    }
}