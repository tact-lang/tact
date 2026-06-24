struct LeftoverSlice {
    val1: Int as uint8;
    val2: Slice as remaining;
}

contract TestContract {
    s: LeftoverSlice;

    init() {
        self.s = LeftoverSlice{
            val1: 42,
            val2: emptyCell().asSlice()
        };
    }
}