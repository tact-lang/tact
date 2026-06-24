struct S1 {
    n: Int;
}

struct S2 {
    s1: S1;
}

contract NestedTwice {
    nested: S2;

    init() {
        self.nested = S2{
            s1: S1{n:5}
        };
    }
}