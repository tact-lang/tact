struct HasString {
    message: String = "test";
}

contract StringFieldContract {
    s: HasString;

    init() {
        self.s = HasString{};
    }
}