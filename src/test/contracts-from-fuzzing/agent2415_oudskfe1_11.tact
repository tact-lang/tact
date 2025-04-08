struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedStructsWithOptionals {
    s1: MultiOptional;
    s2: MultiOptional;

    init() {
        self.s1 = MultiOptional{a: null, b: null, c: "abc"};
        self.s2 = MultiOptional{a: 1, b: true, c: null};
    }
}