struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    n: NestedInner;
    c: String;
    d: Bool?;
}

contract TestStorage {
    s: NestedOuter;
    
    init() {
        self.s = NestedOuter{
            n: NestedInner{
                a: 1,
                b: true,
            },
            c: "test",
            d: false,
        };
    }
}