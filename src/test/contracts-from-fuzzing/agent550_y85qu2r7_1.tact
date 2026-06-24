struct A {
    a: Int;
    opt_b: Int?;
    nested: B;
}

struct B {
    b: Int;
    opt_c: Int?;
}

contract Test {
    data: A;

    init() {
        self.data = A{
            a: 1,
            opt_b: null,
            nested: B{b: 2, opt_c: null},
        };
    }
}