struct States {
    s: String;
    sOpt: String?;
}

contract ContractDefaults {
    x: Int = 1;
    y: Bool = true;
    s: String = "abc";
    sn: String? = null;
    inner: States = States{s: "foo", sOpt: null};

    init() {
        self.x = 1;
        self.y = true;
        self.s = "abc";
        self.sn = null;
        self.inner = States{s: "foo", sOpt: null};
    }
}
