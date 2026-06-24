message Msg {
    x: Int;
}

struct Wrap {
    m: Msg;
    y: Int;
}

contract Test {
    w: Wrap? = null;
}