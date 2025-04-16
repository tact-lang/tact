message(0x01) Msg { val: Int; }

contract MsgAsField {
    m: Msg = Msg { val: 42 };

    receive() { return; }
}