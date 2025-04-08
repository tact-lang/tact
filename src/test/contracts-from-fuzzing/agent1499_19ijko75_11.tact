struct Coord {
    x: Int = 10;
    y: Int = 20;
}

struct Shape {
    center: Coord = Coord{};
    radius: Int = 42;
}

struct Scene {
    circle: Shape = Shape{};
    label: String = "circle";
}

contract Nested3 {
    s: Scene = Scene{};
}
