struct ManyOptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract ComplexOpts {
    opts: ManyOptDefaults;

    init() {
        self.opts = ManyOptDefaults{
            a: null,
            b: null,
            c: null
        };
    }
}
