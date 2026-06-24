// deeply nested optional with explicit serialization inside message struct
message(0xABC) InnerMsg {
    foo: Int as uint8;
}

struct Wrap {
    nested: InnerMsg?;
}

contract DeepMsgSerial {
    data: Wrap?;
    init() {
        self.data = Wrap{
            nested: InnerMsg{ foo: 200 }
        };
    }
}