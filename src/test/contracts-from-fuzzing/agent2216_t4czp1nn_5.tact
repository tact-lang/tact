struct LargeDefault {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;
    e: Address;
    f: Cell;
    g: Slice;
    h: String;
}

contract ContractWithDefaults {
    data: LargeDefault;
    init() {
        self.data = LargeDefault{
            e: myAddress(),
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: "hi"
        };
    }
}
