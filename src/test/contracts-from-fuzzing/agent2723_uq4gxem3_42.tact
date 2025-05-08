struct A {
    i: Int;
}

contract OptNestedA {
    a: A?;
    init() {
        self.a = A{ i: 5 };
    }
}