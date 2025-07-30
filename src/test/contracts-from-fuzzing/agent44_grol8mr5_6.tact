struct Point {
    x: Int;
    y: Int?;
}

message(42) Info {
    title: String;
    pos: Point;
    tag: String?;
}

contract MsgNestedContract {
    info: Info;

    init() {
        self.info = Info{
            title: "title",
            pos: Point{ x:10, y:null },
            tag: null,
        };
    }
}