struct StructWithString {
    name: String;
    message: String;
}

contract StringTest {
    data: StructWithString;

    init() {
        self.data = StructWithString{
            name: "Tester",
            message: "Hello world"
        };
    }
}