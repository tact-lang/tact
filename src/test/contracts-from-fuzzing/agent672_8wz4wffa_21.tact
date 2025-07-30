struct AllBasics {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: Address;
}

contract BasicPersistentVars {
    all: AllBasics;

    init() {
        self.all = AllBasics{
            a: 1,
            b: true,
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: myAddress()
        };
    }
}