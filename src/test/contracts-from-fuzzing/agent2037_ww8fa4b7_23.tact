// persistent optional Builder/Slice/Cell test
contract OptionalsOfSpecial {
    c: Cell?;
    s: Slice?;
    b: Builder?;

    init() {
        self.c = null;
        self.s = null;
        self.b = null;
    }
}
