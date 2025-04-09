struct Point {
    x: Int;
    y: Int;
}

struct Shape {
    center: Point;
}

struct Scene {
    shape: Shape;
}

contract Test {
    receive() {
        // no usage
    }
}