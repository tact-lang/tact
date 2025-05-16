struct TwoBoolsInInt {
    a: Int as uint8;
    b: Bool;
    c: Bool;
}

contract TestContract {
    inner: TwoBoolsInInt;

    init() {
        self.inner = TwoBoolsInInt{ a: 10, b: true, c: false };
    }
}