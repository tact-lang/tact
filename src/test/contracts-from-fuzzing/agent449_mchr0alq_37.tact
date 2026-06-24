// deeply nested message struct in contract storage
message(17) Leaf {
    val: Int;
}

message(18) Mid {
    l: Leaf;
}

message(19) Top {
    m: Mid;
}

contract DeepMsgStorage {
    top: Top;

    init() {
        self.top = Top{ m: Mid{ l: Leaf{ val: 9 } } };
    }
}
