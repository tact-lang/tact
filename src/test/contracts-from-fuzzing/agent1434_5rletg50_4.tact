struct ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract ManyFieldContract {
    storage: ManyFields;
    init() {
        self.storage = ManyFields{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello"
        };
    }
}