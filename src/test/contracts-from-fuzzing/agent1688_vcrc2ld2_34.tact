message(999) MsgWithFlag {
    flag: Bool;
}

contract TestContract {
    mopt: MsgWithFlag?;
    init() {
        self.mopt = null;
    }
}