struct Inner {
    foo: Int;
    bar: Bool?;
}

struct Wrapper1 {
    nested: Inner;
}

struct Wrapper2 {
    nested: Wrapper1;
}

struct Wrapper3 {
    nested: Wrapper2;
}

contract TestContract {
    data: Wrapper3;

    init() {
        self.data = Wrapper3{
            nested: Wrapper2{
                nested: Wrapper1{
                    nested: Inner{
                        foo: 1,
                        bar: null,
                    },
                },
            },
        };
    }
}