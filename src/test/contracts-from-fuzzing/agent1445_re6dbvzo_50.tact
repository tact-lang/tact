contract LargerContract {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Bool = true;
    g: String = "X";
    h: Slice;

    init() {
        self.h = emptyCell().asSlice();
    }
}