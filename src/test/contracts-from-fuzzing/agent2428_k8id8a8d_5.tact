struct A {
    f1: Int;
    f2: Bool?;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{
            f1: 0,
            f2: null,
            f3: "hi",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: myAddress()
        };
    }
}