contract TestContract {
    a: Int = -1;
    b: Bool = true;
    c: String = "abc";
    d: Slice;

    init() {
        self.d = emptyCell().asSlice();
    }

    receive() {}
}