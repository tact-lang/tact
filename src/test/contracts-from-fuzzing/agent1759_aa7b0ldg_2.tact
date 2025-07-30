struct Inner {
    x: Int;
    y: Bool;
    s: String = "hey";
    z: Cell;
    t: Slice;
    addr: Address;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            x: 7,
            y: false,
            z: emptyCell(),
            t: emptyCell().asSlice(),
            addr: myAddress(),
        };
    }

    receive() {}
}