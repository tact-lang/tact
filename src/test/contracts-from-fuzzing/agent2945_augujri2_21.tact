message(1) M1 {}

contract EmptyMsgHolder {
    m: M1;

    init() {
        self.m = M1{};
    }
}