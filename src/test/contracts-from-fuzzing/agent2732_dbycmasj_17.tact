struct WithString {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

contract TestContract {
    data: WithString;

    init() {
        self.data = WithString{
            s1: "1",
            s2: "2",
            s3: "3",
            s4: "4",
            s5: "5"
        };
    }
}