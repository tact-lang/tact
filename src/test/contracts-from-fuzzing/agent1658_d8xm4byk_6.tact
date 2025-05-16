struct OptString {
    text: String?;
}

contract StorageTest {
    data: OptString;

    init() {
        self.data = OptString{
            text: "hi"
        };
    }
}