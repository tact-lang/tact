struct MsgContainer {
    optMsg: MsgType?;
}

message(1) MsgType {
    foo: Int;
}

contract OptionalMsgTest {
    val: MsgContainer;

    init() {
        self.val = MsgContainer{
            optMsg: MsgType{foo:7}
        };
    }
}
