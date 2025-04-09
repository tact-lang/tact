struct Packed {
    small: Int as uint8;
    normal: Int;
    flag: Bool;
    text: String?;
}

contract ParamPacked(
    p: Packed,
) {
    receive() {
        let _ = self.p;
    }
}