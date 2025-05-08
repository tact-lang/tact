message(0x3) MsgOpt {}

struct WrapperOpt { inner: MsgOpt? }

contract OptionalEmptyMessage {
    foo: WrapperOpt;
    init() {
        self.foo = WrapperOpt{ inner: null };
    }
}