struct Sample1 {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract TestContract {
    data: Sample1;
    init() {
        self.data = Sample1{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "Test",
        };
    }
}