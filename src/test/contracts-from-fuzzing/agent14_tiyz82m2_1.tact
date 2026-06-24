struct NestedInner {
    valA: Int;
    valB: Bool?;
}

struct NestedOuter {
    inner: NestedInner; 
    valC: String?;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                valA: 42,
                valB: true,
            },
            valC: "hello",
        };
    }
}