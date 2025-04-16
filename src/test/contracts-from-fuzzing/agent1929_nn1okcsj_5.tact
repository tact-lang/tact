struct A {
    f1: Int;
}

struct B {
    af: A;
    f2: Bool;
}

struct C {
    bf: B;
    f3: String;
}

contract MultiNestedComplex {
    state: C;

    init() {
        self.state = C{
            bf: B{
                af: A{f1: 42},
                f2: true
            },
            f3: "hello"
        };
    }
}