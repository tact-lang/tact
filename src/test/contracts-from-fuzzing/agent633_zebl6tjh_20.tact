struct NestedStrings {
    a: String;
    b: String?;
}

struct Wrap {
    n: NestedStrings;
    c: Int;
}

contract WrapHolder {
    w: Wrap = Wrap{
        n: NestedStrings{ a: "hi", b: null },
        c: 42
    };
}