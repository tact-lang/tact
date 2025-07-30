struct OptRemMix {
    optVal: Int?;
    remVal: Slice as remaining;
}

contract OptRemContract {
    m: OptRemMix;

    init() {
        self.m = OptRemMix{
            optVal: 7,
            remVal: beginCell().endCell().asSlice()
        };
    }
}