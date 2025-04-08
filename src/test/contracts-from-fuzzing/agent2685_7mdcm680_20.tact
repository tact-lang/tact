struct OptionalString {
    text: String?;
}

contract OptStr {
    s: OptionalString = OptionalString{ text: "hello" };
}
