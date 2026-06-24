struct WithStrings {
    short: String;
    long: String;
}

contract TestContract {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            short: "Hi",
            long: "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
        };
    }
}