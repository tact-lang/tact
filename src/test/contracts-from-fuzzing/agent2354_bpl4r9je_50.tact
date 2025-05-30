struct A {
    x: Int;
}

contract ManyNestedInit {
    a: A;

    init() {
        self.a = A{ x: 1 };
        self.a = A{ x: 2 };
    }
}