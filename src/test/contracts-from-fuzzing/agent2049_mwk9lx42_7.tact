struct A {
    a1: Int;
    a2: Int?;
    a3: Bool;
    a4: Bool?;
    a5: Address;
    a6: String;
    a7: Cell;
    a8: Slice;
    a9: Builder;
}

contract Test {
    info: A;

    init() {
        self.info = A{
            a1: 1,
            a2: null,
            a3: true,
            a4: false,
            a5: myAddress(),
            a6: "hello",
            a7: emptyCell(),
            a8: emptyCell().asSlice(),
            a9: beginCell()
        };
    }
}