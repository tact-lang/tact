struct X {
    a: Int;
}

struct Y {
    b: Int;
}

contract TwoStructs {
    foo: X;
    bar: Y;

    init() {
        self.foo = X{a: 5};
        self.bar = Y{b: 10};
    }
}
