struct S {
    a: Int = 1;
    b: Int = 2;
}

contract InitDefaultsTest {
    val: S = S{};

    init() {
        self.val = S{ a: 10, b: 20 };
    }
}