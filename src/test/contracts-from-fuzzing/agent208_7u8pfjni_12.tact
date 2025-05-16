struct WithOptionalDefaults {
    a: Int?; // implicitly default null
    b: Bool? = null;
    c: Bool = false;
}

contract Test13 {
    s: WithOptionalDefaults;

    init() {
        self.s = WithOptionalDefaults{
            a: null,
            b: null,
            c: false,
        };
    }
}