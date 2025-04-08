struct RecIn {
    a: Int;
    b: Bool;
}

struct RecOut {
    inner: RecIn;
    c: Int;
    d: Bool;
}

contract WithRec {
    val: RecOut;

    init() {
        self.val = RecOut{
            inner: RecIn{ a: 1, b: true },
            c: 5,
            d: false
        };
    }

    receive() {
        self.val = RecOut{
            inner: RecIn{ a: 2, b: false },
            c: 6,
            d: true
        };
    }
}