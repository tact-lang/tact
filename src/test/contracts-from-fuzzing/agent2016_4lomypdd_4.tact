struct Inner {
    x: Int;
    flag: Bool = false;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{ x: 7, flag: true };
    }
}