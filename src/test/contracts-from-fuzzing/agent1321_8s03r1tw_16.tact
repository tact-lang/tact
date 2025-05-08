struct Strings {
    s1: String;
    s2: String?;
}

contract StringOpt {
    foo: Strings;
    init() {
        self.foo = Strings{ s1: "hello", s2: null };
    }
}