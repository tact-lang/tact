struct Data {
    val: Int;
}

contract TestContract {
    a: Data? = null;
    b: Data?;
    c: Data = Data{ val: 0 };

    init() {
        self.a = Data{ val: 1 };
        self.b = Data{ val: 2 };
        self.c = Data{ val: 3 };
    }
}
