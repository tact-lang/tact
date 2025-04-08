message(0x42) EmptyMsg {}

struct Wrap {
    m: EmptyMsg;
}

contract MsgStructStorage {
    val: Wrap;

    init() {
        self.val = Wrap{m:EmptyMsg{}};
    }
}
