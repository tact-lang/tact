contract Defaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
    d: Slice;

    init() {
        self.d = emptyCell().asSlice();
    }
}