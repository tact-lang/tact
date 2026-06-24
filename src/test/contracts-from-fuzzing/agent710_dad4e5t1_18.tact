struct HasStringOpt {
    a: String?;
    b: String?;
}

contract TestContract {
    s1: HasStringOpt = HasStringOpt{ a: null, b: null };

    init() {
        self.s1 = HasStringOpt{ a: "foo", b: "bar" };
    }
}