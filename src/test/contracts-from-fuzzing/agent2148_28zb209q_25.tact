trait T {
    v: Int;
}

contract A with T {
    v: Int;

    init() {
        self.v = 7;
    }
}