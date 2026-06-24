// test optional string persistent storage
contract TestOptString {
    content: String? = null;

    init() {
        self.content = "abc";
    }
}
