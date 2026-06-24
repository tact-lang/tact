message(123) TinyMsg {val: Int}

contract OptMsgTest {
    m: TinyMsg?;

    init() {
        self.m = TinyMsg{ val: 99 };
    }
}