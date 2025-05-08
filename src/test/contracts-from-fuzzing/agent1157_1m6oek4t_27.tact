struct SerialHint {
    big: Int as uint32;
    small: Int as int8;
}

contract ParamSerializeTest(
    s: SerialHint
) {
    receive() {
        let tmp = self.s;
    }
}