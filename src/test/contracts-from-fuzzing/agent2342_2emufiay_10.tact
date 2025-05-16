struct HasStrings {
    name: String;
    greeting: String;
}

contract StringsInStorage {
    strings: HasStrings;

    init() {
        self.strings = HasStrings{
            name: "Tact",
            greeting: "Hello World"
        };
    }
}