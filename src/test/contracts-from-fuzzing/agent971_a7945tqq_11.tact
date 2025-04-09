struct S1 { a: Int; }
struct S2 { b: String; }

contract TwoStructVars {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{a: 123};
        self.s2 = S2{b: "foo"};
    }
}