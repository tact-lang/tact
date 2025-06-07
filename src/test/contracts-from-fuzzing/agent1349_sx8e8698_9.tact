struct A {
    val: Int;
}

struct B {
    inner: A;
}

struct C {
    inner: B;
}

contract TripleNestedStruct {
    s: C;

    init() {
        self.s = C{ inner: B{ inner: A{ val: 123 } } };
    }
}