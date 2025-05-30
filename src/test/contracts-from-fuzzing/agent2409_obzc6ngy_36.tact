struct SOrder {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract ChangeInitDifferentOrder {
    s: SOrder;

    init() {
        self.s = SOrder{ d:4, b:2, a:1, c:3 };
    }
}