message(100) DataMsg {
    val: Int;
    flag: Bool;
}

contract MsgStoredPersistent {
    data: DataMsg;

    init() {
        self.data = DataMsg{ val: 7, flag: true };
    }
}