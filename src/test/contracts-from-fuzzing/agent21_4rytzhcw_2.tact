struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
}

contract NestedTest {
    inner: Inner;

    init() {
        self.inner = Inner{
            a: 10,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: myAddress()
        };
    }
}
