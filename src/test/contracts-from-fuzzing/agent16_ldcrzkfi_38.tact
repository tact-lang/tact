struct A {
    x: Int = 7;
}

contract OptStructField {
    f: A? = null;

    init() {
        self.f = A{ x: 123 };
    }
}