struct NestedStrings {
    a: String;
    b: String;
    c: String;
}

contract StringStructs {
    ns: NestedStrings = NestedStrings{
        a: "A",
        b: "B",
        c: "C"
    };

    init() {
        self.ns = NestedStrings{
            a: "AA",
            b: "BB",
            c: "CC"
        };
    }
}