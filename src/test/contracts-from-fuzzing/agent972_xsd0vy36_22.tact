struct Inner {
    value: Int;
}

struct Wrapper {
    nested: Inner;
}

contract OptWrapOptInner {
    wrap: Wrapper?;

    init() {
        self.wrap = Wrapper{
            nested: Inner{ value: 15 }
        };
    }
}
