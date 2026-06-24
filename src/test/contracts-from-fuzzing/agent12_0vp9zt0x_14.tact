struct C {
    value: Int;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract DeepGetter {
    a: A = A{ b: B{ c: C{ value: 99 } } };

    receive() {}

    get fun getDeep() : A {
        return self.a;
    }
}
