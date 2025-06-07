struct Point { x: Int; y: Int; }
struct Rectangle { topLeft: Point; bottomRight: Point; }

contract NestedStructs {
    shape: Rectangle;

    init() {
        self.shape = Rectangle{
            topLeft: Point{x: 0, y: 10},
            bottomRight: Point{x: 5, y: 0},
        };
    }
}