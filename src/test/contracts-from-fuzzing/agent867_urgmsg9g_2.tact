struct BigOne {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Bool?;
    g: Int?;
}

contract LargeStructStorage {
    foo: BigOne;
    init() {
        self.foo = BigOne{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: myAddress(),
            f: false,
            g: null
        };
    }
}