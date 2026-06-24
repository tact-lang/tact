struct S { p: Int; }

contract OptStructDefault {
    s: S? = null;

    init() {
        self.s = null;
    }
}
