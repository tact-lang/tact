message(0x12345678) EmptyMsg2 {}

contract EmpMsgDirectField {
    mymsg: EmptyMsg2;

    init() {
        self.mymsg = EmptyMsg2{};
    }
}