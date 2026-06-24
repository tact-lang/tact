struct EmbeddedString {
    text: String;
}

contract ExtraLongString {
    dat: EmbeddedString;

    init() {
        self.dat = EmbeddedString{ text: "This is a very very very very very long string just to test the serialization handling of large strings in structs." };
    }
}
