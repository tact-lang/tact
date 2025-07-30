struct MessageStructWrapper {
    msg: MyMessage;
}

message(100) MyMessage {
    field: Int;
}

contract ContainsMessageStruct {
    wrapper: MessageStructWrapper;

    init() {
        self.wrapper = MessageStructWrapper{ msg: MyMessage{ field: 7 } };
    }
}