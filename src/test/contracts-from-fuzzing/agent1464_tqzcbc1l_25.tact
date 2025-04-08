struct MixedDefaults {
    a: Int = 1;
    b: Bool;
    c: Int?;
}

contract TestContract {
    m: MixedDefaults;

    init() {
        self.m = MixedDefaults{
            b: false,
            c: null
        };
    }
}