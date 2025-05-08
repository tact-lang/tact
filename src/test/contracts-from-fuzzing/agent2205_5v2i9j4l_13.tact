struct MessageStruct {
    id: Int as uint32;
    content: String;
}

struct Wrapper {
    msg: MessageStruct;
    isRead: Bool;
}

contract MessageStorage {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            msg: MessageStruct{id:1, content:"hi"},
            isRead: false
        };
    }
}