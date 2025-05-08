// test Cell, Slice, String optionals together
contract PrimitiveOptionals {
    c: Cell? = null;
    s: Slice? = null;
    t: String? = null;

    init() {
        self.c = null;
        self.s = null;
        self.t = null;
    }
}
