struct InnerOpt {
    str: String?;
    flag: Bool?;
}

contract NestedOptsTwo {
    a: Int = 1;
    b: InnerOpt = InnerOpt{ str: null, flag: null };

    init() {
        self.a = 42;
        self.b = InnerOpt{ str: "abc", flag: true };
    }
}
