message(0x99) EmptyMessage {}

contract OptionalMessageField {
    optMsg: EmptyMessage?;

    init() {
        self.optMsg = null;
    }
}