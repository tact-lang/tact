struct WithEmptyString {
    s: String;
}

contract EmptyStringContract {
    f: WithEmptyString;
    init() {
        self.f = WithEmptyString{
            s: "",
        };
    }
}