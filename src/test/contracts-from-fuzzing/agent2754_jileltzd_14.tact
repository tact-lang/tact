struct Point {
    x: Int;
    y: Int;
}

message Info {
    point: Point;
    label: String;
}

contract MessageInField {
    info: Info;

    init() {
        self.info = Info{
            point: Point{ x:1, y:2 },
            label: "lbl"
        };
    }
}
