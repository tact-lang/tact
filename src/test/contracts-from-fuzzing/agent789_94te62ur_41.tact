struct S1 {
    foo: Int = 1;
}

contract InitMissingDefaultTest {
    s: S1;

    init() {
        self.s = S1{};
    }
}
