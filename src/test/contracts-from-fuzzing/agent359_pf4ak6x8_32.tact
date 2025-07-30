message(0x12345678) NestedInnerMsg {}

message(0x9abcdef0) OuterMsg {
    inner: NestedInnerMsg;
}

contract MsgFieldTest {
    innerField: NestedInnerMsg;
    outerField: OuterMsg;

    init() {
        self.innerField = NestedInnerMsg{};
        self.outerField = OuterMsg{ inner: NestedInnerMsg{} };
    }
}