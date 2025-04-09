struct Wrapper {
    inner: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract WrappedOptional {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            inner: Inner{
                a: 5,
                b: true,
                c: "opt",
            },
        };
    }
}