struct SDeep {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Int?;
    f7: Bool?;
    f8: String?;
    f9: Cell?;
    f10: Slice?;
}

contract TestContract {
    persist: SDeep;

    init() {
        self.persist = SDeep{
            f1: 1,
            f2: false,
            f3: "test",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: null,
            f7: null,
            f8: null,
            f9: null,
            f10: null
        };
    }
}