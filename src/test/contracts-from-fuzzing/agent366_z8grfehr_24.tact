message(0x2222) EmptyM {}

contract MsgField {
    m: EmptyM;

    init() {
        self.m = EmptyM{};
    }
}