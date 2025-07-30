struct NestedString {
    a: String;
    b: Inner2;
}

struct Inner2 {
    s: String;
}

contract StringNest {
    s: NestedString;

    init() {
        self.s = NestedString{
            a: "hi",
            b: Inner2{s:"world"}
        };
    }
}
