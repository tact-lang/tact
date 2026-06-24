struct HasString {
    s: String;
}

struct NestedString {
    inner: HasString;
}

contract NestedStrings {
    val: NestedString;

    init() {
        self.val = NestedString{ inner: HasString{ s: "test" } };
    }
}