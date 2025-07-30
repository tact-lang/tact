struct MixedPrim {
    s: String;
    c: Cell;
    slice: Slice;
    addr: Address;
    flag: Bool;
}

contract MixedPrimTest {
    mp: MixedPrim;

    init() {
        self.mp = MixedPrim{
            s: "str",
            c: emptyCell(),
            slice: emptyCell().asSlice(),
            addr: myAddress(),
            flag: true
        };
    }
}