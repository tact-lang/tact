struct NestedInner {
    xxx: String;
    yyy: Bool;
}

struct NestedOuter {
    aa: Int;
    bb: NestedInner;
}

contract UseNested {
    foo: NestedOuter = NestedOuter{ aa: 0, bb: NestedInner{ xxx: "hi", yyy: true } };
}