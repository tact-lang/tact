struct OptionalEmptyTest {
    foo: Int?;
}

contract OptEmpty {
    val: OptionalEmptyTest;

    init() {
        self.val = OptionalEmptyTest{};
    }
}