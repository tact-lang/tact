struct Mixed {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Slice;
    f: Address;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 1, b: "s", c: true,
            d: emptyCell(), e: emptyCell().asSlice(), f: myAddress()
        };
    }
}