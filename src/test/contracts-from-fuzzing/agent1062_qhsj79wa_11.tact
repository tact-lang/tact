struct Opts {
    sa: Int?;
    sb: Bool?;
    sc: String?;
}

struct Nested {
    n1: Opts;
    n2: Opts?;
    n3: String?;
}

contract OptionsTest {
    opt: Opts?;
    nested: Nested = Nested{ n1: Opts{}, n2: null, n3: null };

    init() {
        self.opt = Opts{ sa: 111, sb: true, sc: "abc" };
        self.nested = Nested{
            n1: Opts{ sa: 42, sb: false, sc: "xyz" },
            n2: Opts{ sa: 7, sb: true, sc: "deep" },
            n3: "done"
        };
    }
}