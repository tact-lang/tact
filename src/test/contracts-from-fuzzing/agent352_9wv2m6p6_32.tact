struct A {
    x: Int;
}

contract UseA {
    field: A;

    init() {
        self.field = A{x:99};
    }
}