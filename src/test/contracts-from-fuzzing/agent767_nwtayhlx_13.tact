struct Inner {
    n: Int;
    s: String;
}

struct Outer {
    maybeInner: Inner?;
    count: Int;
}

contract OptNestedStruct {
    data: Outer?;

    init() {
        self.data = Outer{
            maybeInner: Inner{ n: 100, s: "hi" },
            count: 2
        };
    }
}
