contract TestContract {
    bigInt1: Int as uint64 = 1;
    bigInt2: Int as int128 = -1;
    bigBool: Bool = true;
    bigStr: String = "hello";

    init() {
        self.bigInt1 = 42;
        self.bigInt2 = -42;
        self.bigBool = false;
    }

    receive() {
        dump(self.bigInt1);
    }
}