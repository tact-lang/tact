struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
}

contract MixedTypesTest {
    data: Mixed;

    init() {
        self.data = Mixed {
            i: 42,
            b: true,
            s: "abc",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell()
        };
    }
}