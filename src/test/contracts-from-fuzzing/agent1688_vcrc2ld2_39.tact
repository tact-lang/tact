message(5151) DMsg {
    count: Int = 100;
    flag: Bool = false;
}

contract TestContract {
    msgfield: DMsg;

    init() {
        self.msgfield = DMsg{};
    }
}