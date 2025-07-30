struct NestedString {
    a: String;
    next: NextString;
}

struct NextString {
    b: String;
    c: String;
}

contract TestNestedString {
    s: NestedString;
    init() {
        self.s = NestedString{
            a: "foo",
            next: NextString{
                b: "bar",
                c: "baz"
            }
        };
    }
}