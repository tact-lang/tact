struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    d: Slice;
    e: Cell;
    f: Address;
}

contract DefaultsFields {
    data: WithDefaults;
    init() {
        self.data = WithDefaults{
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress()
        };
    }
}
