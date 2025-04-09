struct StringTest {
    a: String;
    b: String?;
}

contract TestContract {
    data: StringTest;

    init() {
        self.data = StringTest{
            a: "Hello",
            b: null
        };
    }
}