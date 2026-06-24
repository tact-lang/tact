struct Foo {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract Test {
    foo: Foo;

    init() {
        self.foo = Foo{
            a:1,
            b:true,
            c:"hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell()
        };
    }
}
