message MEmpty {}

contract MsgStored {
    mfield: MEmpty;

    init() {
        self.mfield = MEmpty{};
    }
}