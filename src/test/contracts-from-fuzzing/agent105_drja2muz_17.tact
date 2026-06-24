struct Point {
    x: Int;
    y: Int;
}

struct Rectangle {
    ul: Point; // upper left corner
    lr: Point; // lower right corner
}

struct Canvas {
    rect: Rectangle;
    label: String;
}

contract TestContract {
    canvas: Canvas;

    init() {
        self.canvas = Canvas{
            rect: Rectangle{
                ul: Point{x:0,y:0},
                lr: Point{x:100,y:100}
            },
            label: "hello"
        };
    }
    
    receive() {}
}