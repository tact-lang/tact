struct A {
    i: Int;
}

contract Test {
    a: A;

    init() {
        self.a = A{i:42};
    }

    get fun getA(): A {
        return self.a;
    }
}