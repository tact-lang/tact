struct OptionalStringTest {
    s: String?;
    flag: Bool;
}

contract TestOptionalString {
    data: OptionalStringTest;
    init() {
        self.data = OptionalStringTest{
            s: null,
            flag: true,
        };
    }
}