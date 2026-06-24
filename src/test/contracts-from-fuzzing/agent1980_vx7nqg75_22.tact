struct HasLongString {
    text: String;
}

contract LongStringField {
    item: HasLongString;

    init() {
        self.item = HasLongString{
            text: "This is a very long string to test serialization limits and corner cases in compiler persistent storage logic. "
        };
    }
}