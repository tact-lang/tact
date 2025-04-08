// test message inside optional struct
message(10) Im {
    m: Int;
}

struct Box {
    inner: Im?;
}

contract TestOptMsgWrap {
    val: Box = Box{inner: null};

    init() {
        self.val = Box{inner: Im{m: 99}};
    }
}
