contract OnlyInitOverride {
    foo: Int;
    bar: Bool;
    baz: String;
    boo: Cell;
    faz: Slice;

    init() {
        self.foo = 10;
        self.bar = false;
        self.baz = "fizz";
        self.boo = emptyCell();
        self.faz = emptyCell().asSlice();
    }
}