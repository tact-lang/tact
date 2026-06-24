struct Basic {
    a: Int;
}

contract TwoOptionalsOneNull {
    a: Basic?;
    b: Basic?;

    init() {
        self.a = Basic{ a: 1 };
        self.b = null;
    }
}