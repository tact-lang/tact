message(0x11112222) DirectMessage {
    x: Int;
}

contract DirectPersistMsg {
    m: DirectMessage;

    init() {
        self.m = DirectMessage{ x: 777 };
    }
}
