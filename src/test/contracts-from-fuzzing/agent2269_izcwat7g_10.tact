struct Inner {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    f6: Address;
}

contract DiverseNested {
    nested: Inner;

    init() {
        self.nested = Inner{
            f1: 1,
            f2: false,
            f3: "hello",
            f4: emptyCell().asSlice(),
            f5: emptyCell(),
            f6: myAddress()
        };
    }
}
