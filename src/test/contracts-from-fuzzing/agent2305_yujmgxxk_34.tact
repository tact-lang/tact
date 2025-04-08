struct MixedOptions {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
    e: Cell;
}

contract TestMixedOptions {
    data: MixedOptions;

    init() {
        self.data = MixedOptions{
            a: null,
            b: true,
            c: null,
            d: myAddress(),
            e: emptyCell()
        };
    }
}
