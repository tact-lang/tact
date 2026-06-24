struct Inner {
    x: Int;
    y: Int?;
}

contract TestContract {
    nested: Inner;
    flag: Bool;

    init() {
        self.nested = Inner{ x: 1, y: null };
        self.flag = true;
    }
}