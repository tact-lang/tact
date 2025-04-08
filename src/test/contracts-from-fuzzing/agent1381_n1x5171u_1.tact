struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    i: Int;
    s: String;
    nested: Inner;
    optNested: Inner?;
}

contract DeeplyNested {
    data: Outer;

    init() {
        self.data = Outer{
            i: 42,
            s: "hello",
            nested: Inner{ a:1, b:true },
            optNested: null
        };
    }
}