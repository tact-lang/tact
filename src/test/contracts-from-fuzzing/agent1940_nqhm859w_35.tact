struct Inner {
    a: Int;
    b: Bool;
}

contract AssignmentOrderTest {
    s: Inner;

    init() {
        let tmp = Inner{ a: 10, b: false };
        self.s = tmp;
    }
}