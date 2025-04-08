struct TextBlob {
    content: String;
}

contract LargeStringField {
    text: TextBlob = TextBlob{
        content: "This is a really long string to test large persistent storage concatenations.........................................................."
    };

    init() {
        self.text = TextBlob{
            content: "Another long string, even longer perhaps to see if compiler manages big string persistence.................................................................."
        };
    }
}