message(42) MsgType { val: Int }

contract MessageField {
    stored: MsgType;

    init() {
        self.stored = MsgType{ val: 7 };
    }
}