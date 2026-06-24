struct NestedInner {
    b: Bool;
    txt: String;
}

struct NestedOuter {
    num: Int;
    inner: NestedInner;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            num: 8,
            inner: NestedInner{
                b: true,
                txt: "hello fuzz"
            }
        };
    }
}