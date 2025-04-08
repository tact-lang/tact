struct WithStrings {
    s1: String;
    s2: String;
    s3: String;
}

contract TestContract {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            s1: "Hello",
            s2: "World",
            s3: "TON"
        };
    }
}