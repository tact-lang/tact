struct A {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Slice;
    f7: Builder;
}

contract Test {
    data: A;

    init() {
        self.data = A{
            f1: 10,
            f2: true,
            f3: "string",
            f4: emptyCell(),
            f5: myAddress(),
            f6: emptyCell().asSlice(),
            f7: beginCell()
        };
    }
}