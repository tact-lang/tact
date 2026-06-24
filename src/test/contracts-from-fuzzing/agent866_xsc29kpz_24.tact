struct NestedString {
    s: String;
}

struct Wrap {
    n: NestedString;
}

contract WithStr {
    w: Wrap;
    init() {
        self.w = Wrap{ n: NestedString { s: "abc" } };
    }
}