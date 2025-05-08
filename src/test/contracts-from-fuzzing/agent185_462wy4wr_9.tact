struct WithStrings {
    title: String;
    subtitle: String?;
}

contract StringStorage {
    data: WithStrings;

    init() {
        self.data = WithStrings{
            title: "Hello",
            subtitle: null
        };
    }
}