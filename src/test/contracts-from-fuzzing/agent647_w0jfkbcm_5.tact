struct Tuple {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
}

contract TestContract {
    tup: Tuple;
    
    init() {
        self.tup = Tuple{
            a: 42,
            b: true,
            c: "test",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null
        };
    }
}