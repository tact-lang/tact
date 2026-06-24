struct A {
    value: Int;
}

contract ReassignStructField {
    s: A;
    init() {
        self.s = A{value:1};
        self.s = A{value:42};
    }
}
