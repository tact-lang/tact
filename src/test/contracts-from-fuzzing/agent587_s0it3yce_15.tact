struct OptDefaults {
    xx: Int? = null;
    yy: Bool? = null;
}

contract OptDefaultsPersist {
    val: OptDefaults;
    init() {
        self.val = OptDefaults{};
    }
    receive() {
        let _ = self.val.xx;
    }
}