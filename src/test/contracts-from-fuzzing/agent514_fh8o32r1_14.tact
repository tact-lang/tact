struct WithStrings {
    sa: String;
    sb: String;
    sc: String;
    sd: String;
}

contract ManyStrings {
    data: WithStrings;
    init() {
        self.data = WithStrings{
            sa: "a", sb: "b", sc: "c", sd: "d"
        };
    }
}