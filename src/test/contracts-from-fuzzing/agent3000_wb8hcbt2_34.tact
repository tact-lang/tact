struct Mismatch {
    val: Int as uint8;
    b: Bool;
    s: String;
}

contract Test32 {
    m: Mismatch;

    init() {
        self.m = Mismatch{
            val: 9999,   // deliberately out of range
            b: true,
            s: "fail",
        };
    }
}
