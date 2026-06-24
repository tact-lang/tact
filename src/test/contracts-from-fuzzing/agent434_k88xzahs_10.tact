struct Point {
    x: Int;
    y: Int;
}

struct Box {
    topLeft: Point;
    bottomRight: Point;
}

struct LabeledBox {
    box: Box;
    name: String;
    visible: Bool;
}

contract TestContract {
    info: LabeledBox;

    init() {
        self.info = LabeledBox{
            box: Box{
                topLeft: Point{ x: 0, y: 10 },
                bottomRight: Point{ x: 5, y: 0 }
            },
            name: "area",
            visible: true
        };
    }
}