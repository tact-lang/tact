struct A {
    foo: Int;
}

struct B {
    bar: Int;
}

contract OrderTest {
    first: B;
    second: A;

    init() {
        self.first = B{ bar: 1 };
        self.second = A{ foo: 2 };
    }
}