struct MessageLike {
    id: Int;
    payload: Payload;
}

struct Payload {
    content: String;
    important: Bool;
}

contract ComplexFieldContract {
    msgData: MessageLike;

    init() {
        self.msgData = MessageLike{
            id:100,
            payload: Payload{content:"foo", important:true}
        };
    }
}