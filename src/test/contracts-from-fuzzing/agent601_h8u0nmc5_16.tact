struct IntAndString {
    num: Int as uint64;
    text: String;
}

struct IntStringWrap {
    wrap: IntAndString;
}

contract MixField {
    mix: IntStringWrap;

    init() {
        self.mix = IntStringWrap{
            wrap: IntAndString{
                num: 1234567890,
                text: "test"
            }
        };
    }
}
