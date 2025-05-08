struct A {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
    t: Int = 4;
}

contract Test {
    a: A;

    init() {
        self.a = A{};
    }
}