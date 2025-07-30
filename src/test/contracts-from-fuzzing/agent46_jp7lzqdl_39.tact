message(0x1234) SimpleMsg { val: Int }

contract NullableMsg {
    m: SimpleMsg?;

    init() {
        self.m = null;
    }
}
