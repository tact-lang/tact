struct A {
    x: Int;
}

struct B {
    x: Int;
    s: String;
}

struct C {
    a: A;
    b: B;
}

contract MultiStructs {
    data: C;

    init() {
        self.data = C{
            a: A{x:10},
            b: B{x:20, s:"hello"},
        };
    }
}