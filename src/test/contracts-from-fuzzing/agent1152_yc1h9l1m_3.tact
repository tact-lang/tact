struct A {
    foo: Int;
    bar: Bool;
    baz: String;
    cell: Cell;
    addr: Address;
}

contract Test {
    rec: A;

    init() {
        self.rec = A{
            foo: 1,
            bar: true,
            baz: "hello",
            cell: emptyCell(),
            addr: myAddress(),
        };
    }
}