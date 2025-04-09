struct S {
    foo: Int = 1;
    bar: Int?;
    baz: String;
    qux: Bool;
    addr: Address;
    content: Cell;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            bar:null,
            baz:"hello",
            qux:true,
            addr: myAddress(),
            content: emptyCell(),
        };
    }
}