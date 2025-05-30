struct WithStrings {
    a: String;
    b: String;
    c: String?;
}

contract StringHolder {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            a: "hello",
            b: "world",
            c: null
        };
    }
}