struct HasString {
    name: String;
    phrase: String;
}

contract StringFields {
    info: HasString = HasString{
        name: "abc",
        phrase: "hello"
    };
}