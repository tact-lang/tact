message Msg {
    x: Int;
}

struct Wrap {
    m: Msg;
    y: Int;
}

contract Test {
    w: Wrap = Wrap { m: Msg { x: 1 }, y: 2 };
}