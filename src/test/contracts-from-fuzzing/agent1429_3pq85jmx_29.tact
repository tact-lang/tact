struct A {
    x: Int;
}

contract Defaults {
    a: A = A{ x: 11 };

    init() {
        self.a = A{ x: 22 };
    }
}