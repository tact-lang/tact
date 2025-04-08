struct MessageContainer {
    m: EmptyMsg;
}

message(7) EmptyMsg {}

contract StructWithMessage {
    val: MessageContainer;

    init() {
        self.val = MessageContainer{
            m: EmptyMsg{}
        };
    }
}
