struct DeeplyNested {
    x: Int;
    y: Int;
    nested: NestedInner;
}

struct NestedInner {
    a: Bool;
    str: String;
    opt: Int?;
    inner2: Inner2Nested;
}

struct Inner2Nested {
    f: Bool;
    txt: String?;
}

contract DeepNesting {
    d: DeeplyNested;

    init() {
        self.d = DeeplyNested{
            x: 1,
            y: 2,
            nested: NestedInner{
                a: true,
                str: "hello",
                opt: 5,
                inner2: Inner2Nested{
                    f: false,
                    txt: null
                }
            }
        };
    }
}
