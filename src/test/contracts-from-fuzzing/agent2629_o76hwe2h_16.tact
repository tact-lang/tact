struct NestedStrings {
    a: String;
    b: InnerString;
}

struct InnerString {
    c: String;
    d: Bool;
}

contract StringNest {
    val: NestedStrings = NestedStrings{
        a: "level1",
        b: InnerString{
            c: "level2",
            d: true
        }
    };

    init() {}
}