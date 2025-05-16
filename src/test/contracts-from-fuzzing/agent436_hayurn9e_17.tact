struct Embedded {
    s: Slice;
    c: Cell;
    a: Address;
}

contract TestContract {
    value: Embedded;
    init() {
        self.value = Embedded{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            a: myAddress(),
        };
    }
}
