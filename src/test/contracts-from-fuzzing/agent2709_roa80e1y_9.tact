struct Nested {
    foo: Int;
    bar: Bool;
    baz: String;
}

contract LargeMixTyped {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    s: Nested;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "x";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.s = Nested{foo:1, bar:true, baz:"y"};
    }
}