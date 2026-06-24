struct StringsTest {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract TestContract {
    data: StringsTest;

    init() {
        self.data = StringsTest{
            a: "hello",
            b: null,
            c: "world",
            d: null
        };
    }
}