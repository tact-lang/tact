struct A {
    val: Int;
}

contract DupStructFields {
    a: A;
    b: A;

    init() {
        self.a = A{val:1};
        self.b = A{val:2};
    }
}
