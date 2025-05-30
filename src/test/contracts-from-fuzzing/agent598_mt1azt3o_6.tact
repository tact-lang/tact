struct SerialInner {
    smallU: Int as uint8;
    bigS: Int as int64;
}

struct SerialOuter {
    count: Int as uint32;
    nested: SerialInner;
}

contract SerialContract {
    field: SerialOuter;

    init() {
        self.field = SerialOuter{
            count: 99999,
            nested: SerialInner{
                smallU: 255,
                bigS: -1234567890
            }
        };
    }
}