struct LargeDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Slice;
    e: Cell;
}

contract TestDefaults {
    data: LargeDefaults;

    init() {
        self.data = LargeDefaults{
            d: emptyCell().asSlice(),
            e: emptyCell()
        };
    }
}