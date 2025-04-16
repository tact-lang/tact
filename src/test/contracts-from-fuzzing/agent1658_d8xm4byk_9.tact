contract StorageTest {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "x";
    g: Int? = null;
    h: String? = null;
    i: Bool? = null;
    j: Address? = null;

    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.g = 10;
        self.h = "hello";
        self.i = false;
        self.j = myAddress();
    }
}