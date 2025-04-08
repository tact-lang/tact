message(123) EmptyM {}

contract HasOnlyEmptyMsg {
    msgField: EmptyM;

    init() {
        self.msgField = EmptyM{};
    }
}