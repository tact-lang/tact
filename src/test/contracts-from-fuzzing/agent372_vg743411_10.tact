struct A {
    foo: Int;
    bar: Int;
}

struct B {
    foo: Int;
    bar: Int;
}

contract Test {
    a: A;
    b: B;
    init() {
        self.a = A{foo:1,bar:2};
        self.b = B{foo:3,bar:4};
    }
}