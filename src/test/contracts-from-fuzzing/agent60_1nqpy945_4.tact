struct BigOne {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Bool?;
    g: Int?;
}

contract TestContract {
    all: BigOne;

    init() {
        self.all = BigOne{
            a: 3,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: myAddress(),
            f: null,
            g: 42
        };
    }
}