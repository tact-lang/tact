message(0x2) EmptyMessage {}

struct WrapMsg { msg: EmptyMessage }

contract WrappedEmptyMessageField {
    data: WrapMsg;
    init() {
        self.data = WrapMsg{ msg: EmptyMessage{} };
    }
}