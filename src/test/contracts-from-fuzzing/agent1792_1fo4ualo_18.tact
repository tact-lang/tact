struct WithStrings {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
}

contract TestContract {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            s1: "one",
            s2: "two",
            s3: "three",
            s4: "four"
        };
    }
}