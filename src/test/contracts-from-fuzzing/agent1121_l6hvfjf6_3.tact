struct Coordinate {
    x: Int;
    y: Int;
}

struct Rectangle {
    topLeft: Coordinate;
    bottomRight: Coordinate;
}

contract NestedStructStorage {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            topLeft: Coordinate{x: 0, y: 10},
            bottomRight: Coordinate{x:10, y:0}
        };
    }
}