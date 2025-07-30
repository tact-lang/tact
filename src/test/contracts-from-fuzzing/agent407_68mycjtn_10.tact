struct DefaultMix {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
    d: Cell;
    e: Address;
    f: Slice;
}

contract MixDefaults {
    data: DefaultMix;
    init() {
        self.data = DefaultMix{
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice(),
        };
    }
}
