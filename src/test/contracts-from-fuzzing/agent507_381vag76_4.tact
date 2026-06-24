struct A {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Cell;
    x5: Slice;
    x6: Address;
    x7: Int?;
    x8: Bool?;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{
            x1: 1,
            x2: true,
            x3: "abc",
            x4: emptyCell(),
            x5: emptyCell().asSlice(),
            x6: myAddress(),
            x7: null,
            x8: null
        };
    }
}