contract PersistentMessage {
    data: Msg;

    init() {
        self.data = Msg{
            s: Inner{ val: 55 },
            x: 123
        };
    }
}

message Msg {
    s: Inner;
    x: Int;
}

struct Inner {
    val: Int;
}
