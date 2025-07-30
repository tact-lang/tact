struct A {
    x: Int;
}

struct B {
    a: A;
    y: String;
}

contract Test {
    f: B;

    init() {
        self.f = B{a: A{x:1}, y:"hi"};
    }
}