message(42) MsgTest {
    q: Int;
}

contract Test29 {
    m: MsgTest;
    init() {
        self.m = MsgTest { q: 99 };
    }
}