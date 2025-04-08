struct OptTest {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
    qux: String?;
}

contract OptionalsTest {
    data: OptTest;
    init() {
        self.data = OptTest{
            foo: null,
            bar: true,
            baz: null,
            qux: "abc"
        };
    }
}