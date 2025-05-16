struct Basic {
    a: Int;
}

contract BothOptionalsPop {
    a: Basic?;
    b: Basic?;

    init() {
        self.a = Basic{ a: 5 };
        self.b = Basic{ a: 6 };
    }
}