message(1) MsgEmpty {}

contract MsgAsPersist {
    m: MsgEmpty;

    init() {
        self.m = MsgEmpty{};
    }
}