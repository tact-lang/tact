struct A {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Cell;
    f8: Slice;
    f9: Address;
}

contract Test {
    data: A;

    init() {
        self.data = A{
            f1: 1,
            f2: true,
            f3: null,
            f4: null,
            f5: "hi",
            f6: null,
            f7: emptyCell(),
            f8: emptyCell().asSlice(),
            f9: myAddress(),
        };
    }
}
