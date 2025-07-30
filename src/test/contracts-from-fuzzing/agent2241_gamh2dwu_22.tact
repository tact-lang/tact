struct WithStrings {
    a: String = "a";
    b: String = "b";
    c: String = "c";
    d: String = "d";
    e: String = "e";
}

contract ManyStrings {
    data: WithStrings;

    init() {
        self.data = WithStrings{};
    }
}