struct NestedString {
    inner: InnerString?;
}

struct InnerString {
    s: String;
}

contract NestedOptionalString {
    d: NestedString;

    init() {
        self.d = NestedString{
            inner: InnerString{ s: "nested" }
        };
    }
}