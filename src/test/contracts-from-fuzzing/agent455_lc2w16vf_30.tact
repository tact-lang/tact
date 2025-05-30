struct S {
    a: Int;
    b: String;
}
contract DoubleStruct {
    s1: S;
    s2: S;
    init() {
        self.s1 = S{a: 1, b: "foo"};
        self.s2 = S{a: 2, b: "bar"};
    }
}