struct WithStrings {
    a: String;
    b: String;
    c: String;
}

contract Test {
    strings: WithStrings;

    init() {
        self.strings = WithStrings{
            a: "one",
            b: "two",
            c: "three" 
        };
    }
}