message(1) InnerMsg {
    code: Int;
}

struct WrapMsg {
    inner: InnerMsg;
    label: String;
}

contract Test {
    data: WrapMsg;

    init() {
        self.data = WrapMsg{
            inner: InnerMsg{ code: 123 },
            label: "nested",
        };
    }
}