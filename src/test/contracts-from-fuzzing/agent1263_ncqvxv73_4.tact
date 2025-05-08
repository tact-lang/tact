struct A {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Cell;
    a5: Slice;
    a6: Builder;
    a7: Address;
    a8: Int?;
    a9: Bool?;
    a10: String?;
}

contract Test {
    a: A;

    init() {
        self.a = A{
            a1: 1,
            a2: true,
            a3: "str",
            a4: emptyCell(),
            a5: emptyCell().asSlice(),
            a6: beginCell(),
            a7: myAddress(),
            a8: null,
            a9: null,
            a10: null,
        };
    }
}