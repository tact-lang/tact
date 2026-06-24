contract OptStructMsg {
    s: Outer;

    init() {
        self.s = Outer{
            inner: null
        };
    }
}

struct Outer {
    inner: Inner?;
}

struct Inner {
    msg: TestMsg;
}

message(0x44) TestMsg {
    val: Int;
}
