struct StringTest {
    foo: String;
    bar: String;
}

contract StringStorage {
    s: StringTest;

    init() {
        self.s = StringTest{ foo: "Hello", bar: "World" };
    }
}