struct NestedInner {
    a: Int;
    b: Bool;
    c: String;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract TestNestedStruct {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                a: 5,
                b: true,
                c: "test",
            },
            flag: false,
        };
    }
}