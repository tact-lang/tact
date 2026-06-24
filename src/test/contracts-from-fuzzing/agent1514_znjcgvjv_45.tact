struct Embed {
    s: String;
}

contract OptionalInitNull {
    a: Embed?;

    init() {
        self.a = null;
    }
}