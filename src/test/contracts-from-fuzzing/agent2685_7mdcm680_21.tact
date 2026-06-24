struct OptionalString {
    text: String?;
}

contract OptStrNull {
    s: OptionalString = OptionalString{ text: null };
}
