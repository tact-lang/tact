struct OptionalWithRemain {
    remain: Slice as remaining;
}

contract OptRemainInner {
    dat: OptionalWithRemain?;

    init() {
        self.dat = null;
    }
}