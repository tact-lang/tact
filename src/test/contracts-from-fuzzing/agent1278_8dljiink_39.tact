message(999) Carry {
    len: Int;
    stuff: Slice as remaining;
}

contract TestContract {
    optCarry: Carry?;

    init() {
        self.optCarry = null;
    }
}