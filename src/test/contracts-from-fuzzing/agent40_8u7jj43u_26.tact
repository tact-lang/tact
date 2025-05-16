struct MsgInner {
    a: Int;
    b: String;
}

struct MsgMiddle {
    x: MsgInner;
    y: Int;
}

contract TestNestedMulti {
    data: MsgMiddle;

    init() {
        self.data = MsgMiddle{
            x: MsgInner{a:42,b:"da"},
            y: 99
        };
    }

    receive() {
        let tmp = self.data;
    }
}