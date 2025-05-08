contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    s1: Slice;
    c1: Cell;
    str: String;
    
    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.s1 = emptyCell().asSlice();
        self.c1 = emptyCell();
        self.str = "test";
    }
}