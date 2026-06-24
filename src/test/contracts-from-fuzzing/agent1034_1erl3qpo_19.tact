struct SText {
    message: String;
    note: String?;
}

contract OptionalStringNested {
    text: SText = SText{
        message: "Hello",
        note: null,
    };
}