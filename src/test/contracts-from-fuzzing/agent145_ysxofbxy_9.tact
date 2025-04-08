struct MessagesLike {
    msg: Msg?;
    id: Int;
}

message(0x123) Msg {
    val: Int;
}

contract OptionalMessageInStruct {
    data: MessagesLike;

    init() {
        self.data = MessagesLike{
            msg: Msg{ val: 50 },
            id: 1
        };
    }
}