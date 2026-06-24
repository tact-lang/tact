struct P {
    a: Int;
    b: Bool;
}

contract Test {
    arr: P?;

    init() {
        self.arr = P { a: 10, b: true };
    }
}
