struct WithLongStrings {
    a: String;
    b: String;
}

contract Test {
    val: WithLongStrings;

    init() {
        self.val = WithLongStrings{
            a: "This is a very long string just to test storage edge cases",
            b: "Another extremely long string with different content",
        };
    }
}
