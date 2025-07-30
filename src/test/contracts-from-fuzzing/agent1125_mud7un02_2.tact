struct DeeplyNested {
    inner: Inner;
}

struct Inner {
    inner2: Inner2;
}

struct Inner2 {
    value: Int;
}

contract TestContract {
    x: DeeplyNested;

    init() {
        self.x = DeeplyNested{
            inner: Inner{
                inner2: Inner2{
                    value: 123,
                },
            },
        };
    }
}