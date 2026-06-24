message(12345678) DefaultMsg {
    a: Int = 7;
    b: Bool = true;
    c: String = "ok";
}

contract TestContract {
    m: DefaultMsg;

    init() {
        self.m = DefaultMsg{};
    }
}