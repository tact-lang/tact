struct OptInt {
    x: Int?;
}

struct OptBool {
    b: Bool?;
}

contract OptionsComplex {
    oi: OptInt? = null;
    ob: OptBool? = null;
    init() {
        self.oi = null;
        self.ob = null;
    }
}