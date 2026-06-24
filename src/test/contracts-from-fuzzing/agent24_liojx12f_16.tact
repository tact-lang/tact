struct ManyStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract STest {
    s: ManyStrings = ManyStrings{
        a: "a",
        b: "b",
        c: "c",
        d: "d",
        e: "e",
    };

    init() {}
}