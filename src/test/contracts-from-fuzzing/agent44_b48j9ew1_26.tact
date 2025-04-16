struct OutOfOrder {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: String?;
    f5: Bool?;
}

contract Mixed {
    s: OutOfOrder;

    init() {
        self.s = OutOfOrder{
            f1: 1,
            f2: null,
            f3: true,
            f4: null,
            f5: false
        };
    }

    receive() {
        self.s.f5 = true;
    }
}