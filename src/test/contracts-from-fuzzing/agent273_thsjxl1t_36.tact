message(123) EmptyMsg {}

struct WrapMsg {
    m: EmptyMsg;    
}

contract Test36 {
    w: WrapMsg;
    init() {
        self.w = WrapMsg{ m: EmptyMsg{} };
    }
}