struct A {
    x: Int = 1;
    y: Bool = false;
    z: String = "text";
}

contract Test {
    a1: A;
    a2: A;
    a3: A;
    init() {
        self.a1 = A{};
        self.a2 = A{};
        self.a3 = A{};
    }
}