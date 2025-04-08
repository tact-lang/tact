contract SerialFormats {
    a: Int as uint4 = 10;
    b: Int as int64 = 20;
    c: Int as uint256 = 30;
    d: Bool = true;
    receive() {
        let _ = self.b;
    }
}