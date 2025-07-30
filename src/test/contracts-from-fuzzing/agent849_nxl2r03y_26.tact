message(0x12) InnerMsg {
    foo: Int;
}

message(0x34) OuterMsg {
    inner: InnerMsg?;
    label: String;
}

contract TestContract {
    data: OuterMsg;

    init() {
        self.data = OuterMsg{
            inner: null,
            label: "hi"
        };
    }
}