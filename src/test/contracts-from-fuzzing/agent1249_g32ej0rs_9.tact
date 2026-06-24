message(0xDEADBEEF) MyMsg {
    val: Int;
    ok: Bool;
}

struct Wrap {
    inner: MyMsg;
    note: String;
}

contract TestContract {
    wrapped: Wrap;

    init() {
        self.wrapped = Wrap{
            inner: MyMsg{ val: 999, ok: true },
            note: "hi"
        };
    }
}