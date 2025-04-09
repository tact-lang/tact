struct AA { a: Int; }
contract InlineDefaultOpt {
    opt: AA? = null;
    i: Int = 0;

    init() {
        self.opt = AA{ a: 99 };
        self.i = 42;
    }
}