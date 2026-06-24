message(99) OptionalMsg {
    flag: Bool?;
    count: Int?;
    label: String;
}

contract OptMsgPersist {
    saved: OptionalMsg?;

    init() {
        self.saved = null;
    }
}