struct SemiDefaults {
    f1: Int = 5;
    f2: Bool;
}

contract TestContract {
    sd: SemiDefaults;

    init() {
        self.sd = SemiDefaults{
            f2: true
        };
    }
}