struct WithStrings {
    a: String;
    b: String?;
    c: String = "default";
}

contract StringsStructContract {
    val: WithStrings;

    init() {
        self.val = WithStrings{
            a: "abc",
            b: null
        };
    }
}