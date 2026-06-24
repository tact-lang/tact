struct SString {
    str: String;
}

contract StringFieldPersistence {
    s: SString;
    init() {
        self.s = SString{
            str: "Hello, blockchain!"
        };
    }
}