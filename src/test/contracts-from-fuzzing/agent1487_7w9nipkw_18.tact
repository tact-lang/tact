message(0x99) MsgWrap {
    val: Int;
}

contract MsgInStorage {
    s: MsgWrap;

    init() {
        self.s = MsgWrap{ val: 42 };
    }
}