struct Foo {
    a: Int as int16;
    b: Int as uint32;
    c: Bool;
    d: String;
    e: Slice;
    f: Address;
    g: Cell;
}

contract MultiTypeStructField {
    myField: Foo;

    init() {
        self.myField = Foo {
            a: 1,
            b: 2,
            c: true,
            d: "str",
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: emptyCell(),
        };
    }
}