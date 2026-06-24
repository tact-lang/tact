struct A {
    foo: Int;
}

struct B {
    bar: Int;
}

struct C {
    a: A;
    b: B;
    opt: Int?;
}

contract Test {
    data: C;
    
    init() {
        self.data = C{
            a: A{foo: 1},
            b: B{bar: 2},
            opt: null
        };
    }
}