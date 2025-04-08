struct BoolInt {
    b: Bool;
    i: Int;
}

struct IntBool {
    i: Int;
    b: Bool;
}

contract TestContract {
    bi: BoolInt;
    ib: IntBool;

    init() {
        self.bi = BoolInt{b: true, i: 10};
        self.ib = IntBool{i: 20, b: false};
    }

    receive() {
        let _ = self.bi.b;
        let _ = self.ib.b;
    }
}