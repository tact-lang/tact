message(1) EmptyMsg {}

struct HasEmptyMsg {
    m: EmptyMsg;
}

contract UseEmptyMsg {
    data: HasEmptyMsg;

    init() {
        self.data = HasEmptyMsg{ m: EmptyMsg{} };
    }
}