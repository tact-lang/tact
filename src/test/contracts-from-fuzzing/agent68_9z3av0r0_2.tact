struct TestDefaults {
    a: Int;
    b: Bool = false;
    c: String?;
    d: String = "hello";
}

contract DefaultsContract {
    df: TestDefaults;

    init() {
        self.df = TestDefaults{
            a: 123,
            // should pick up default b and d automatically
            c: null
        };
    }
}