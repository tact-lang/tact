contract TooSmallSigned {
    b: Int as int8;
    init() {
        self.b = -129;
    }
}