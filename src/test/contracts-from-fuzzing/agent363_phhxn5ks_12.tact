struct DeepNest {
    s1: String;
    inner: Inner;
}

struct Inner {
    flag: Bool;
    nestedInner: NestedInner;
}

struct NestedInner {
    number: Int;
    text: String;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            s1: "deep",
            inner: Inner{
                flag: true,
                nestedInner: NestedInner{
                    number: 999,
                    text: "innermost"
                }
            }
        };
    }

    receive() {}
}