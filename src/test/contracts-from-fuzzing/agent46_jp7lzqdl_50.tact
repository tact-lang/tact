message(0xE1) SingleField { a: Int }

contract OptMsgField {
    data: SingleField?;

    init() {
        self.data = null;
    }
}
