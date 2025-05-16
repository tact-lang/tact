struct Point {
    x: Int as int32;
    y: Int as int32;
}

message(0xB00B) Shape {
    id: Int;
    pos: Point;
    visible: Bool;
}

contract TestContract {
    data: Shape;

    init() {
        self.data = Shape{
            id: 456,
            pos: Point{
                x: 3,
                y: 4
            },
            visible: true
        };
    }
}