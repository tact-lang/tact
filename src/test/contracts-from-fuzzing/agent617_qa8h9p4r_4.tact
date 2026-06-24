struct S1 {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
}

contract Test {
    data: S1;
    init() {
        self.data = S1{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: "abc"
        };
    }
}