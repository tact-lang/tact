struct Point {
    x: Int;
    y: Int;
}

struct Rect {
    topLeft: Point;
    bottomRight: Point;
}

struct Canvas {
    bgColor: String;
    drawing: Rect;
}

contract NestedStructsOpt {
    canvas: Canvas?;

    init() {
        self.canvas = null;
    }
}
