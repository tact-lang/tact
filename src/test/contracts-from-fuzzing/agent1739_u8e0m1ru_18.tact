struct A {
    ai: Int;
}

contract DefaultStructInit {
    s: A;

    init() {
        self.s = A{ ai: 123 };
    }
}