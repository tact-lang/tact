contract TinyOverflow {
    x: Int as uint4;

    init() {
        self.x = 20;  // exceeds uint4 max of 15
    }
}