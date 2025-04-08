struct S1 { a: Int; }
struct S2 { b: Int; }
struct Combo {
    s1: S1;
    opt: S2?;
}

contract NestedComb {
    foo: Combo;

    init() {
        self.foo = Combo{
            s1: S1{a:1},
            opt: null
        };
    }
}