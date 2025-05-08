message(0x50) M { value: Int; }

contract OptionalMsgField {
    m: M?;

    init() {
        self.m = null;
    }
}
