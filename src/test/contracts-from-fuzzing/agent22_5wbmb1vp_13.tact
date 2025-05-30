struct NestedStrings {
    a: String;
    b: String;
    inner: InnerStrings;
}

struct InnerStrings {
    c: String;
    d: String;
}

contract TestContract {
    s: NestedStrings;

    init() {
        self.s = NestedStrings{
            a: "one",
            b: "two",
            inner: InnerStrings{c: "three", d: "four"}
        };
    }
}