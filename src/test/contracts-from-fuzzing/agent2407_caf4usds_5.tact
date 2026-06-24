struct A {
    foo: Int;
}

struct B {
    bar: A;
}

contract TestContract {
    testField: B;

    init() {
        self.testField = B{bar: A{foo: 99}};
    }
}