struct ComplexNested {
    s1: Sub1;
    s2: Sub2;
    opt: Sub3?;
}

struct Sub1 {
    i: Int;
    b: Bool;
}

struct Sub2 {
    val: Int;
    inner: SubInner;
}

struct SubInner {
    flag: Bool;
}

struct Sub3 {
    nested: SubNested?;
}

struct SubNested {
    v: Int;
}

contract TestContract {
    data: ComplexNested;

    init() {
        self.data = ComplexNested{
            s1: Sub1{ i: 1, b: true },
            s2: Sub2{ val: 2, inner: SubInner{ flag: false } },
            opt: null
        };
    }
}