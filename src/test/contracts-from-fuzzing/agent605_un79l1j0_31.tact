struct Point {
    x: Int;
    y: Int;
}

message(42) EmptyMsg {}

struct Container {
    msg: EmptyMsg;
    pt: Point;
}

contract MessageAndStruct {
    val: Container;

    init() {
        self.val = Container{
            msg: EmptyMsg{},
            pt: Point{ x: 1, y: 2 }
        };
    }
}