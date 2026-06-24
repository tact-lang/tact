message(0x1234) MsgTest {
    num: Int = 7;
}

contract TestContract {
    m: MsgTest? = null;

    init() {
        self.m = null;
    }
}