struct OnlyPrims {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract TestContract {
    foo: OnlyPrims;

    init() {
        self.foo = OnlyPrims{
            a: 7,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello"
        };
    }
}