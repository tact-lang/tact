// optional message struct explicitly null
message(0xDEAD) DeadMsg { inner: Int; }

contract NullMsgTest {
    m: DeadMsg?;

    init() {
        self.m = null;
    }
}