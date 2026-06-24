struct HasString {
    message: String;
}

contract StringStorage {
    data: HasString;

    init() {
        self.data = HasString{ message: "Hello world!" };
    }
}