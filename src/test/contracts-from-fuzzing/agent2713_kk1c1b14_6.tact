struct NestedString {
    s: String;
    optStr: String?;
}

struct HasStrings {
    a: String;
    b: NestedString;
}

contract TestContract {
    data: HasStrings;

    init() {
        self.data = HasStrings{
            a: "hello",
            b: NestedString{
                s: "world",
                optStr: null
            }
        };
    }
}
