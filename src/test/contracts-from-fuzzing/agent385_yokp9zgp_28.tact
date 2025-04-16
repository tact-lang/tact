struct Point { x: Int as int64; y: Int as int64; }
struct Rectangle { topLeft: Point; bottomRight: Point; }

contract NestedStructSerialization {
    rect: Rectangle;

    init() {
        self.rect = Rectangle{
            topLeft: Point{ x: 10, y: 20 },
            bottomRight: Point{ x: 50, y: 60 }
        };
    }
}