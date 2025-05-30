struct NestedInner {
    a: Int;
    b: Bool;
    c: String;
}

struct NestedMiddle {
    inner: NestedInner;
    d: Bool;
}

contract StructsInPersistence {
    middle: NestedMiddle;
    init() {
        self.middle = NestedMiddle{
            inner: NestedInner{
                a: 5,
                b: true,
                c: "abc"
            },
            d: false
        };
    }
}