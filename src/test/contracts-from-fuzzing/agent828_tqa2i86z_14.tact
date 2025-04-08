message(1000) InnerMsg {
    foo: Int;
    bar: Bool;
}

message(2000) OuterMsg {
    x: Int;
    y: InnerMsg?;
}

contract TestContract {
    saved: OuterMsg;

    init() {
        self.saved = OuterMsg{
            x: 888,
            y: InnerMsg{
                foo: 999,
                bar: true
            }
        };
    }
}