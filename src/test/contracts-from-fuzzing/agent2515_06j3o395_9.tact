struct Base1 {
    a: Int;
}

struct Base2 {
    b: Bool;
}

struct Base3 {
    c: String;
}

struct NestedBig {
    s1: Base1;
    s2: Base2;
    s3: Base3;
}

contract DeepComb {
    f: NestedBig;
    init() {
        self.f = NestedBig{
            s1: Base1{a: 42},
            s2: Base2{b: false},
            s3: Base3{c: "x"}
        };
    }
}
