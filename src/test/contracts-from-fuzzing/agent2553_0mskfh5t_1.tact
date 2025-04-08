struct NestedInner {
    a: Int?; 
    b: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    s: String;
}

contract TestDeepNested {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{a: null, b: true},
            s: "test"
        };
    }
}