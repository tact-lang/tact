message(1001) InnerMsg {
    code: Int;
}

message(2002) OuterMsg {
    inner: InnerMsg;
    text: String;
}

contract TestContract {
    data: OuterMsg;

    init() {
        self.data = OuterMsg{
            inner: InnerMsg{ code: 7 },
            text: "message"
        };
    }
}