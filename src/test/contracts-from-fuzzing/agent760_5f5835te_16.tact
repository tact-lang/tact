contract MultiLineString {
    content: String = "Hello\nWorld\\nLine2\tTabbed\"Quote'";

    init() {
        self.content = "ok";
    }
}