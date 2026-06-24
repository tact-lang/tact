struct Msg {
    id: Int as uint32;
    body: String;
}

contract StructPersist {
    m: Msg;
    init() {
        self.m = Msg{ id: 0x123456, body: "hello" };
    }
}