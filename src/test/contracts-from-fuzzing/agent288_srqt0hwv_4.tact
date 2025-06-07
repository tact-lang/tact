struct ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
}

contract TestContract {
    storage: ManyTypes;

    init() {
        self.storage = ManyTypes{
            a: 7,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice()
        };
    }
}