struct WithStrings {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract TestContract {
    data: WithStrings;

    init() {
        self.data = WithStrings {
            a: "A",
            b: null,
            c: "C",
            d: null
        };
    }
}