message Msg {
    x: Int = 333;
    y: Int = 222+1;
}

contract TestContract {
    m: Msg;
    init() {
        self.m = Msg{};  // relies on defaults
    }
}
