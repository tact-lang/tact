struct TextFields {
    greeting: String;
    farewell: String;
}

contract ContractWithStrings {
    texts: TextFields;

    init() {
        self.texts = TextFields{
            greeting: "Hello, World!",
            farewell: "Goodbye!"
        };
    }
}
