message MEmpty {}

contract MsgEmptyField {
    m: MEmpty;

    init() {
        self.m = MEmpty{};
    }
}
