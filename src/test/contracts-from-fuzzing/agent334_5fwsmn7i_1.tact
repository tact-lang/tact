struct NestedInner {
    a: Int;
    b: String?;
}

struct NestedOuter {
    c: Bool;
    d: NestedInner;
    e: String;
    f: Bool?;
}

contract StorageFuzz {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            c: true,
            d: NestedInner{
                a: 1,
                b: "test",
            },
            e: "hello",
            f: false,
        };
    }
}