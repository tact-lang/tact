struct A {
    val: Int = 5;
}

contract Test {
    a: A;

    init() {
        self.a = A{};
    }
}