struct ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
}

contract TestContract {
    storage: ManyTypes;

    init() {
        self.storage = ManyTypes{
            a: 42,
            b: false,
            c: "test string",
            d: beginCell().endCell().asSlice(),
            e: beginCell().endCell(),
            f: myAddress()
        };
    }
}