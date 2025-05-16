struct S1 {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
}

contract TestContract {
    s: S1;

    init() {
        self.s = S1{
            f1: 1,
            f2: true,
            f3: "hello",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: beginCell(),
        };
    }
}