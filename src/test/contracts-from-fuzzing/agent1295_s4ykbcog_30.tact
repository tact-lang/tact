// contract persistent var is optional message struct with inner optionals
message(0x1234) ComplexMsg {
    foo: Int?;
    bar: Bool?;
}

contract OptMsgWrap {
    val: ComplexMsg?;

    init() {
        self.val = ComplexMsg{
            foo: null,
            bar: true
        };
    }
}