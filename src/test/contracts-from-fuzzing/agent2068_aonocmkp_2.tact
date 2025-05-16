struct NestedNest {
    level: Int;
    nested: Inner;
}

struct Inner {
    val: Int;
    text: String;
}

contract MultiNested {
    data: NestedNest;

    init() {
        self.data = NestedNest{level: 5, nested: Inner{val: 42, text: "hi"}};
    }
}