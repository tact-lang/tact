message(0x100) SampleMsg {
    value: Int;
}

contract TestContract {
    mopt: SampleMsg?;

    init() {
        self.mopt = SampleMsg{ value: 55 };
    }
}