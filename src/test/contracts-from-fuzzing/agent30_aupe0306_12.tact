struct WithStrings {
    a: String;
    b: String;
    c: String;
}

contract StringStructStorage {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            a: "foo",
            b: "bar",
            c: "baz"
        };
    }
}