struct Meta {
    count: Int;
    note: String?;
}

message(42) ComplexMsg {
    meta: Meta;
    flag: Bool;
}

contract MsgCont {
    saved: ComplexMsg;

    init() {
        self.saved = ComplexMsg{ meta: Meta{ count: 0, note: null }, flag: true };
    }
}