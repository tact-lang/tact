struct Complex {
    n: Int;
    s: String;
    opt: Bool?;
    addr: Address;
    sl: Slice;
}

contract CombinedTypes {
    c: Complex;

    init() {
        self.c = Complex{
            n: 42,
            s: "hi",
            opt: null,
            addr: myAddress(),
            sl: emptyCell().asSlice()
        };
    }
}
