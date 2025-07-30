struct Coord {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Coord;
    bottomRight: Coord;
}

struct Window {
    outer: Rectangle;
    inner: Rectangle;
}

contract NestedRectangles {
    win: Window;

    init() {
        self.win = Window{
            outer: Rectangle{
                topLeft: Coord{x:0, y:0},
                bottomRight: Coord{x:100, y:100}
            },
            inner: Rectangle{
                topLeft: Coord{x:25, y:25},
                bottomRight: Coord{x:75, y:75}
            }
        };
    }
}