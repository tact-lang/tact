struct OptionalInner {
    deep: Inner?;
}

struct Inner {
    val: Int;
}

contract OptInnerExample {
    content: OptionalInner;

    init() {
        self.content = OptionalInner{
            deep: null
        };
    }
}
