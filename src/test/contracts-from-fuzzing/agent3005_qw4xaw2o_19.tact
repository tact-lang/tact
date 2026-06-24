struct LargeOrdering {
    x1: Int;
    x2: Bool?;
    x3: String?;
    x4: Address;
    x5: Slice?;
    x6: Int?;
    x7: Cell;
    x8: String;
}

contract OrderingTest {
    rec: LargeOrdering;

    init() {
        self.rec = LargeOrdering{
            x1: 42,
            x2: null,
            x3: null,
            x4: myAddress(),
            x5: null,
            x6: null,
            x7: emptyCell(),
            x8: "text"
        };
    }
}