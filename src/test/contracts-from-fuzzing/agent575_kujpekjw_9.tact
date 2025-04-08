message(2) EmptyMsg2 {}

contract OptEmptyMsgField {
    data: EmptyMsg2?;

    init() {
        self.data = null;
    }
}