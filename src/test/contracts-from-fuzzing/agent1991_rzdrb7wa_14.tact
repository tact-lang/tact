struct Embedded {
    val: Int;
    text: String;
}

struct Outer {
    nested1: Embedded;
    nested2: Embedded;
}

contract TwoNestedStructs {
    inner: Outer;

    init() {
        self.inner = Outer{
            nested1: Embedded{ val:1, text:"a" },
            nested2: Embedded{ val:2, text:"b" }
        };
    }
}