struct Mixed {
    a: Int = 1;
    b: Bool = true;
    c: Cell;
    d: Slice;
}

contract TestContract {
    m: Mixed;
    init() {
        self.m = Mixed{
            c: emptyCell(),
            d: emptyCell().asSlice()
        };
    }
}