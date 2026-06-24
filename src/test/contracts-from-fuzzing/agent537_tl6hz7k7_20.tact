contract TestContract {
    num: Int as int4;

    init() {
        self.num = 7;
    }

    receive() {
        self.num = -8;  // minimal for int4
    }
}
