message M {
    value: Int;
}

contract Test {
    stored: M?;
    init() {
        self.stored = null;
    }
    receive(msg:M) {
        self.stored = msg;
    }
}