struct Point {
    x: Int;
    y: Int;
}

message(0x01) EmptyMsg {}

contract MsgInStore {
    data: Point = Point{ x: 1, y: 2 };
    msg: EmptyMsg = EmptyMsg{};

    init() {
        self.data = Point{ x: 10, y: 20 };
        self.msg = EmptyMsg{};
    }
}