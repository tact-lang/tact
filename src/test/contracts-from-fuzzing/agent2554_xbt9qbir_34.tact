message(123) Msg { x: Int; }

contract MsgStorage {
    m: Msg;

    init() {
        self.m = Msg{ x: 7 };
    }
}