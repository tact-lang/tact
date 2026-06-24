struct OptionSliceAddr {
    s: Slice?;
    a: Address?;
}

contract OptionalSliceAddr {
    data: OptionSliceAddr;

    init() {
        self.data = OptionSliceAddr { s: null, a: null };
    }
}
