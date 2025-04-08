struct Namer {
    first: String;
    middle: String?;
    last: String;
}

contract OptionStrings {
    n: Namer;

    init() {
        self.n = Namer{
            first: "One",
            middle: null,
            last: "Last"
        };
    }
}