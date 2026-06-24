struct SubOpt1 {
    foo: Int?;
    bar: Bool;
}
struct SubOpt2 {
    baz: String?;
    qux: Int;
}

contract TwoOptStructs {
    s1: SubOpt1;
    s2: SubOpt2;

    init() {
        self.s1 = SubOpt1{ foo: null, bar: true };
        self.s2 = SubOpt2{ baz: null, qux: 42 };
    }
}
