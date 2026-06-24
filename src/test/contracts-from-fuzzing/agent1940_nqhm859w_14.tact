struct WithString {
    s: String;
}

struct Wrap {
    inner: WithString;
}

contract NestedStrings {
    val: Wrap;

    init() {
        self.val = Wrap{ inner: WithString{ s:"test" } };
    }
}