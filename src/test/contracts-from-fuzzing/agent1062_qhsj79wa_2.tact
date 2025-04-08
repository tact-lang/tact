struct Point {
    x: Int = 0;
    y: Int = 0;
}

struct Circle {
    center: Point;
    radius: Int = 1;
}

struct Scene {
    mainCircle: Circle;
    title: String = "scene";
}

contract Test {
    scene: Scene = Scene{ mainCircle: Circle{ center: Point{ x: 5, y: 5 }, radius: 10 }, title: "main scene" };

    init() {
        self.scene = Scene{ mainCircle: Circle{ center: Point{ x: 2, y: 2 }, radius: 3 }, title: "init scene" };
    }
}