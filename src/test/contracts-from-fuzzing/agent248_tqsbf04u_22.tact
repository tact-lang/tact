struct Inner {
    foo: Int? = 5;
    bar: Bool?;
}

struct Outer {
    inner: Inner;
    name: String? = "goku";
}

contract SkipSomeInner {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                bar: null // skip foo assigns, rely on default
            },
            // skip name assign, rely on default "goku"
        };
    }
}