struct StringFields {
    a: String;
    b: String;
    c: String;
    d: String?;
    e: String?;
}

contract StringStorage {
    strings: StringFields = StringFields{
        a: "alpha",
        b: "beta",
        c: "gamma",
        d: null,
        e: "epsilon"
    };
}