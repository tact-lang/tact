struct ReorderTest {
    f1: Int as int64;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
}

contract ReorderContract {
    state: ReorderTest;

    init() {
        self.state = ReorderTest{
            f1: 11,
            f2: false,
            f3: "x",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: beginCell(),
        };
    }
}