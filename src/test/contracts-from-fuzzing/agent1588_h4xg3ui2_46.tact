message FilledMsg {
    foo: Int;
    bar: Bool;
}

struct MsgWrapper {
    m: FilledMsg?;
}

contract OptOverStructOptMsg {
    w: MsgWrapper?;
    init() {
        self.w = null;
    }
}