message(1) InnerMsg {
    val: Int;
}

message(2) OuterMsg {
    inner: InnerMsg?;
    flag: Bool?;
}

contract TestContract {
    stored: OuterMsg;

    init() {
        self.stored = OuterMsg{
            inner: null,
            flag: null,
        };
    }
}
