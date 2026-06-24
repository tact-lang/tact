struct OptionTuple {
    x0: Int?;
    x1: Int?;
    x2: Int?;
    x3: Int?;
    x4: Int?;
}

contract Test {
    tup: OptionTuple;

    init() {
        self.tup = OptionTuple{ x0: null, x1: null, x2: null, x3: null, x4: null };
    }
}