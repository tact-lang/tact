struct A {
    foo: Int;
}

struct B {
    bar: Int;
}

contract Test {
    a: A;
    b: B;
    c: Int;
    d: Bool;
    e: String;

    init() {
        self.a = A{foo:1};
        self.b = B{bar:2};
        self.c = 3;
        self.d = true;
        self.e = "hi";
    }
}