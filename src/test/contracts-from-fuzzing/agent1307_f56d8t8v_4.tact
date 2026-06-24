struct S1 {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
}

contract ManyFields {
    data: S1;

    init() {
        self.data = S1{
            f1: 1,
            f2: false,
            f3: "abc",
            f4: emptyCell(),
            f5: emptyCell().asSlice()
        };
    }
}