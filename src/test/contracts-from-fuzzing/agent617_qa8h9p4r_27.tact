message(0x42) EmptyMsg {}

contract NullEmptyMsgField {
    data: EmptyMsg?;
    init() {
        self.data = null;
    }
}