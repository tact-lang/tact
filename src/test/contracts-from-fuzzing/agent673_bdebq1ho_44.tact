contract LargeBitwidths {
    a: Int as uint256;
    b: Int as int257;

    init() {
        self.a = 1;
        self.b = -1;
    }
}