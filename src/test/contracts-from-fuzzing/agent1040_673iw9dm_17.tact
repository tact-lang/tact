message(0x01) SampleMsg {
    value: Int;
}

contract TestContract {
    mopt: SampleMsg?;

    init() {
        self.mopt = null;
    }
}