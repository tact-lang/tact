struct SerialRem {
    i: Int as uint32;
    remains: Slice as remaining;
}

contract Test {
    sr: SerialRem;
    init() {
        self.sr = SerialRem{
            i: 100,
            remains: emptyCell().asSlice()
        };
    }
}