message(0x3) EmptyMessage {}

struct Holder {
    nested: EmptyMessage;
}

contract NestedEmptyMessage {
    val: Holder;
    init() {
        self.val = Holder { nested: EmptyMessage {} };
    }
}