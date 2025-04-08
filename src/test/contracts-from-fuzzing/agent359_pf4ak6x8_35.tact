message(0x11) OptInnerMsg { x: Int }

struct Wrapper {
    m: OptInnerMsg?;
}

contract OptMsgField {
    val: Wrapper;
    init() {
        self.val = Wrapper{ m: null };
    }
}