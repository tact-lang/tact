message(0xABAB) MsgInner { foo: Int as uint16; }

struct Container {
  inner: MsgInner?;
}

contract OptMsgSerial {
    x: Container?;

    init() {
        self.x = Container{
            inner: MsgInner{ foo: 65535 }
        };
    }
}