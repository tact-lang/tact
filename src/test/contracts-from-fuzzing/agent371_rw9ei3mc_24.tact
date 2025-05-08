struct A {
    s: String;
}

struct B {
    a: A;
    s: String;
}

struct C {
    b: B;
    a: A;
}

contract NestedStringTest {
    data: C;

    init() {
        self.data = C{
            b: B{a: A{s:"x"}, s:"y"},
            a: A{s:"z"}
        };
    }
}