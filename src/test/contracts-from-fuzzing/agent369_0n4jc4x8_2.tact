struct NoDefaults {
    a: Int;
    b: Bool;
    c: String;
}

contract NoDefaultTest {
    data: NoDefaults;

    init() {
        self.data = NoDefaults{
            a: 123,
            b: true,
            c: "test",
        };
    }
}