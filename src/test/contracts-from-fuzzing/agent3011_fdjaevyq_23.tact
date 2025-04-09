struct Grand {
    a: Int;
    b: Bool;
    c: GrandChild;
}

struct GrandChild {
    d: String;
}

contract NestedInnerString {
    foo: Grand;
    init() {
        self.foo = Grand{ a: 1, b: true, c: GrandChild{ d: "str" } };
    }
}