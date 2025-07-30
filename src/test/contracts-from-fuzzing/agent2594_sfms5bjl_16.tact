struct HasStringAndBool {
    title: String;
    flag: Bool;
}

contract StructStringBool {
    content: HasStringAndBool;

    init() {
        self.content = HasStringAndBool{ title: "hi", flag: true };
    }
}