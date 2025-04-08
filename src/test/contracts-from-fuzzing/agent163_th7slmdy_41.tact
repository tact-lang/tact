message MyMsg {
    id: Int?;
}

struct WrapMsg {
    inner: MyMsg;
}

contract MsgAsPersistedField {
    wrapper: WrapMsg;

    init() {
        self.wrapper = WrapMsg { inner: MyMsg { id: null } };
    }
}