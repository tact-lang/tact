struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract StringFields {
    data: ManyStrings = ManyStrings{
        a: "one",
        b: "two",
        c: "three",
        d: "four",
        e: "five",
    };
}
