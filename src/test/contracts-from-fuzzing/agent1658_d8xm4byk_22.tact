struct OptionMix {
    ai: Int?;
    ab: Bool?;
    astr: String?;
    aaddr: Address?;
    aslice: Slice?;
    acell: Cell?;
}

contract StorageTest {
    data: OptionMix;

    init() {
        self.data = OptionMix{
            ai: null,
            ab: null,
            astr: null,
            aaddr: null,
            aslice: null,
            acell: null
        };
    }
}