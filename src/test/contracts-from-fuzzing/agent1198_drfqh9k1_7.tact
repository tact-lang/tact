contract ManyTypes {
    i0: Int;
    b0: Bool;
    s0: String;
    a0: Address;
    c0: Cell;
    sl0: Slice;

    i1: Int;
    b1: Bool;
    s1: String;
    a1: Address;
    c1: Cell;
    sl1: Slice;

    i2: Int;
    b2: Bool;
    s2: String;
    a2: Address;
    c2: Cell;
    sl2: Slice;

    init() {
        self.i0 = 0; self.b0 = false; self.s0 = "a"; self.a0 = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"); self.c0 = emptyCell(); self.sl0 = emptyCell().asSlice();
        self.i1 = 1; self.b1 = true; self.s1 = "b"; self.a1 = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"); self.c1 = emptyCell(); self.sl1 = emptyCell().asSlice();
        self.i2 = 2; self.b2 = false; self.s2 = "c"; self.a2 = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"); self.c2 = emptyCell(); self.sl2 = emptyCell().asSlice();
    }

    receive() {
        self.i0 = 42;
    }
}