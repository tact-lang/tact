struct Mixed {
    s: String;
    n: Int;
    f: Bool;
    addr: Address;
    sl: Slice;
}

contract MixFields {
    data: Mixed;

    init() {
        self.data = Mixed{
            s: "test",
            n: 42,
            f: false,
            addr: myAddress(),
            sl: emptyCell().asSlice()
        };
    }
}