struct DefaultsPartial {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "hi";
}

contract Test {
    defVals: DefaultsPartial;

    init() {
        self.defVals = DefaultsPartial{
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice()
        };
    }
}