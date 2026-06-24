struct OptionMix {
    inner: Int?;
}

contract TestContract {
    m1: OptionMix;
    m2: OptionMix;

    init() {
        self.m1 = OptionMix{ inner:null };
        self.m2 = OptionMix{ inner:123 };
    }
}