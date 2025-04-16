struct OptDefaults {
    oi: Int?;
    ob: Bool?;
}

contract OptionalsDefaultNullImplicit {
    val: OptDefaults;

    init() {
        self.val = OptDefaults{ oi: null, ob: null };
    }
}