struct StringTest {
    name: String;
    description: String?;
}

contract TestContract {
    data: StringTest;

    init() {
        self.data = StringTest{ name: "Test", description: null };
    }
}