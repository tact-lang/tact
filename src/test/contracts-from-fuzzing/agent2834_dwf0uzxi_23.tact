struct NestedDefaultsOpt {
    x: Int = 1;
    y: Bool = true;
    z: String = "abc";
    optInt: Int?;
    optBool: Bool?;
}

contract NestedDefaultsOptsContract {
    def: NestedDefaultsOpt;
    opt: NestedDefaultsOpt?;

    init() {
        self.def = NestedDefaultsOpt{};
        self.opt = null;
    }
}