struct WithStrings {
    s1: String;
    s2: String;
    optS: String?;
}

contract StringFields {
    data: WithStrings = WithStrings{
        s1: "Hello",
        s2: "World",
        optS: null
    };
}