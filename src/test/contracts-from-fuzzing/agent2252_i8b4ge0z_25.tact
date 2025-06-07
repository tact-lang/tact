message(0x1) EmptyOkay {}

contract EmptyMsgInField2 {
    m: EmptyOkay;
    init() {
        self.m = EmptyOkay{};
    }
}