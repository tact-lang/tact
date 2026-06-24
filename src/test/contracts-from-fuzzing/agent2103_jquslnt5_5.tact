message(0x11111111) EmptyMsg {}

contract OptMessageHolder {
    msgHolder: EmptyMsg? = null;

    init() {
        self.msgHolder = null;
    }
}
