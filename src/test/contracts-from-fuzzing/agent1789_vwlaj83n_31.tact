struct A {
    x: Int;
}

contract AssignInInit {
    a: A;

    init() {
        self.a = A{ x: 42 };
    }
}