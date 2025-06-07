message(0x1234) TopMsg {
    nested: NestedMsg;
}

message(0x5678) NestedMsg {
    val: Int;
}

contract TestMessageInMessage {
    data: TopMsg;

    init() {
        self.data = TopMsg {
            nested: NestedMsg {
                val: 123
            }
        };
    }
}