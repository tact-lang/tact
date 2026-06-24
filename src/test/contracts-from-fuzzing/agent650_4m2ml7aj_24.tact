// Large number of fields of mixed primitives with some defaults
contract TestContract {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Bool = false;
    e: String = "one";
    f: String = "two";
    g: Address;
    h: Slice;
    i: Cell;

    init() {
        self.g = myAddress();
        self.h = emptyCell().asSlice();
        self.i = emptyCell();
    }
}
