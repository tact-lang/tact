struct ManyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
}

contract MultiPrimitiveStorage {
    storage: ManyPrimitives;

    init() {
        self.storage = ManyPrimitives{
            i: -123,
            b: true,
            s: "hello",
            c: emptyCell(),
            a: myAddress(),
        };
    }
}