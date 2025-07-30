struct OptionalMsg {
    val: Int;
}

message MyMsg {
    inner: OptionalMsg?;
}

contract MsgInContract {
    f: MyMsg;

    init() {
        self.f = MyMsg{
            inner: null
        };
    }
}