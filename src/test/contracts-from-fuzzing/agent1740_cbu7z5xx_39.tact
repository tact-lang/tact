message(0x10) InnerEmpty {}

message(0x20) Outer {
    inner: InnerEmpty;
}

contract NestedEmptyMsgs {
    val: Outer;
    init() {
        self.val = Outer { inner: InnerEmpty {} };
    }
}