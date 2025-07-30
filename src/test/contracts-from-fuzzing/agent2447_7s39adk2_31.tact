message(0x111) Msg {
    val: Int;
    inner: Data?;
}

struct Data {
    x: Int;
}

contract MsgPersist {
    m: Msg = Msg{ val: 5, inner: null };
}