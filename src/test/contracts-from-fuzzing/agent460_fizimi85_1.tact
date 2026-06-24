struct A {
    a1: Int;
    a2: Bool;
    a3: Address;
    a4: Cell;
    a5: Slice;
    a6: String;
    a7: Int?;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{
            a1: 1,
            a2: true,
            a3: myAddress(),
            a4: emptyCell(),
            a5: emptyCell().asSlice(),
            a6: "test",
            a7: null,
        };
    }
}