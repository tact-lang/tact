struct MultiDefaults {
    a: Int = 1;
    b: String = "a";
    c: Bool = false;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
}

contract DefPlusOpts {
    val: MultiDefaults;
    init() {
        self.val = MultiDefaults{
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null
        };
    }
}
