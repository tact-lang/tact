struct Combination {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
    o: Int?;
}

contract ComboTest {
    combo: Combination;

    init() {
        self.combo = Combination{
            i: 1,
            b: true,
            s: "hello",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            o: null
        };
    }
}
