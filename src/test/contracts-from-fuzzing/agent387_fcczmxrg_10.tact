struct Inner {
    s1: String;
    s2: String?;  
}

struct Outer {
    id: Int;
    inner: Inner;
    flag: Bool?;
}

contract DeepNestedOpt {
    outer: Outer;

    init() {
        self.outer = Outer{
            id: 42,
            inner: Inner{
                s1: "foo"
                // s2 omitted (optional, defaults null)
            }
            // flag omitted (optional, defaults null)
        };
    }
}