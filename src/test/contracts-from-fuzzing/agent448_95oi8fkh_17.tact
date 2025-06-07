struct StringTest {
    a: String;
    b: String?;
}

contract StringTestContract {
    data: StringTest;

    init() {
        self.data = StringTest{
            a: "hello",
            b: null,
        };
    }

    receive() {}
}