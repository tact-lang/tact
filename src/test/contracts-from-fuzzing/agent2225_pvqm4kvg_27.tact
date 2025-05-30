struct A {
    x: Int = 123;
    y: Int;
}

contract MismatchDefault {
    data: A;

    init() {
        self.data = A{ y: 456 };
    }
}