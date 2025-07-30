struct Inner {
    val: Int;
}

struct Mid {
    inner: Inner;
}

struct Outer {
    mid: Mid;
}

contract NestedContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid: Mid{
                inner: Inner{
                    val: 123,
                },
            },
        };
    }

    receive() {}
}