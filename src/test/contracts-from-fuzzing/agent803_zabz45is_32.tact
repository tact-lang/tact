struct WithEmptyString {
    s: String;
}

contract EmptyStringInit {
    val: WithEmptyString;
    init() {
        self.val = WithEmptyString{ s: "" };
    }
}