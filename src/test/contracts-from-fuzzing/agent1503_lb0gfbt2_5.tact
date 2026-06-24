struct Point {
    x: Int;
    y: Int;
}

struct Rect {
    topLeft: Point;
    bottomRight: Point;
}

struct Window {
    title: String;
    border: Bool;
    contentRect: Rect;
}

contract ComplexNestedStruct {
    window: Window;

    init() {
        self.window = Window{
            title: "win",
            border: true,
            contentRect: Rect{
                topLeft: Point{ x: 0, y: 0 },
                bottomRight: Point{ x: 100, y: 100 }
            }
        };
    }

    receive() {}
}