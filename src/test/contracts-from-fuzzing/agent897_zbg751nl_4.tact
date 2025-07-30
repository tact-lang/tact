struct Point {
    x: Int;
    y: Int;
}

struct Box {
    topLeft: Point;
    bottomRight: Point;
    label: String;
}

contract Test {
    mainBox: Box;
    description: String = "empty";

    init() {
        self.mainBox = Box{
            topLeft: Point{ x: 0, y: 0 },
            bottomRight: Point{ x: 10, y: 10 },
            label: "Test Box"
        };
        self.description = "done";
    }
}
