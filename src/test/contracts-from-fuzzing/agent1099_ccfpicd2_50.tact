struct A {
    foo: Int;
}

struct B {
    bar: Bool;
}

contract StructPair {
    a: A;
    b: B;

    init() {
        self.a = A{foo:42};
        self.b = B{bar:true};
    }
}