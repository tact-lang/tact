struct WithString {
    name: String;
    phrase: String;
    city: String;
    bio: String;
}

contract ManyStrings {
    textData: WithString;

    init() {
        self.textData = WithString{
            name: "Alice",
            phrase: "Hello",
            city: "Wonderland",
            bio: "Explorer"
        };
    }
}