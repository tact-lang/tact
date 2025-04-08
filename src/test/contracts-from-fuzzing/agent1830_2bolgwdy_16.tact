struct SerializeBoolInt {
    flag: Bool;
    num: Int as uint16;
}

struct WrapSerialize {
    content: SerializeBoolInt;
}

contract TestContract {
    data: WrapSerialize;

    init() {
        self.data = WrapSerialize{
            content: SerializeBoolInt{
                flag: false,
                num: 12345
            }
        };
    }
}
