struct NestedString {
    s: String;
}

struct OuterString {
    nested: NestedString;
    s2: String;
}

contract LargeStrings {
    data: OuterString;
    init() {
        self.data = OuterString{
            nested: NestedString{ s: "A very very long text string that potentially is large enough to break things." },
            s2: "Another quite large string to fill space."
        };
    }
    receive() {}
}