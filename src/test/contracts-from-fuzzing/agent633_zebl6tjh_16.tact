struct Strings {
    s1: String;
    s2: String?;
}

contract StringFields {
    val: Strings = Strings{
        s1: "Hello",
        s2: null
    };
}