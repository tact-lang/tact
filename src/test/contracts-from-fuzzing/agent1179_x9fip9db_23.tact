struct InnerMost {
    foo: Int?;
}

struct Inner {
    bar: InnerMost?;
}

struct Outer {
    baz: Inner;
}

contract ChainOpt {
    data: Outer;

    init() {
        self.data = Outer{
            baz: Inner{
                bar: null
            }
        };
    }

    receive() {}
}