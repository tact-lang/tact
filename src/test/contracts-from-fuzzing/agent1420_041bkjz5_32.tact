message MyMsg {}

struct HasMsg {
    m: MyMsg;
}

contract TestContract {
    h: HasMsg = HasMsg{ m: MyMsg{} };
    init() {}
}