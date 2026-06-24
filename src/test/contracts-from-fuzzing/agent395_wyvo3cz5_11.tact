struct Outer {
    i: Int;
    s: InnerString;
}

struct InnerString {
    s: String;
}

contract NestedString {
    val: Outer;
    init() {
        self.val = Outer{
            i: 1,
            s: InnerString{ s: "Nested" }
        };
    }
}
