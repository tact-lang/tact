struct WithString {
    name: String;
    desc: String;
    comment: String?;
}

contract ManyStrings {
    s: WithString;

    init() {
        self.s = WithString{
            name: "name",
            desc: "desc",
            comment: null
        };
    }
}
