struct A {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Address;
    a5: Cell;
    a6: Slice;
}

contract DiversePersistent {
    data: A;

    init() {
        self.data = A{
            a1: 1,
            a2: true,
            a3: "test",
            a4: myAddress(),
            a5: emptyCell(),
            a6: emptyCell().asSlice(),
        };
    }
}