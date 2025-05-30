contract Test {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    s: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    c2: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
    addr: Address = address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2");

    init() {
        self.a = 2;
        self.b = false;
        self.c = "world";
    }
}