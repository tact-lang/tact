struct Inner {
    f1: Int;
    f2: Int as uint32;
    f3: Int as int64;
    f4: Int as coins;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ f1: 1, f2: 2, f3: 3, f4: ton("1") };
    }
}