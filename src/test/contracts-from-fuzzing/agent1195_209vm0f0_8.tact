message(1) MsgEmpty {}

contract MsgAsField {
    m: MsgEmpty;

    init() {
        self.m = MsgEmpty{};
    }
}
