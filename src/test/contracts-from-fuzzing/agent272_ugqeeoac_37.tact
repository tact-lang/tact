message(42) MsgEmpty {}

contract UsesEmptyMsg {
    field: MsgEmpty;

    init() {
        self.field = MsgEmpty{};
    }
}