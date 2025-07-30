struct WithStrings {
    greeting: String;
    name: String?;
}

contract TestContract {
    data: WithStrings;
    init() {
        self.data = WithStrings{
            greeting: "Hello",
            name: null
        };
    }
}