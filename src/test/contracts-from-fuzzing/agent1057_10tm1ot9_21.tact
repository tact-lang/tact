struct A {
    x: Int;
}

contract DefaultsTest {
    a: A = A{ x: 5 };

    init() {
        self.a = A{ x: 10 };
    }
}