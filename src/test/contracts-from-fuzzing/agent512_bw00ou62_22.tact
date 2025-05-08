message(0x42) EmptyMsg {}

struct MsgHolder {
    body: EmptyMsg;
}

contract MessageStructFieldTest {
    data: MsgHolder;

    init() {
        self.data = MsgHolder{
            body: EmptyMsg{}
        };
    }
}