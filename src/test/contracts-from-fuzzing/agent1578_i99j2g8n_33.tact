contract TestContract {
    a: Int;
    rest: Slice as remaining;

    init() {
        let s = emptyCell().asSlice();
        self.a = 42;
        self.rest = s;
    }
}