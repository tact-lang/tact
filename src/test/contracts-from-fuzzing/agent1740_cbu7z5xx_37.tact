message(0x1) EmptyMsg {}

message(0x2) WrapMsg {
    inner: EmptyMsg;
}

contract WrapContract {
    val: WrapMsg;
    init() {
        self.val = WrapMsg { inner: EmptyMsg {} };
    }
}