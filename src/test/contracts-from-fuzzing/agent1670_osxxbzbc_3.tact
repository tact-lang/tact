struct DeepOptional {
    inner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestDeepOpt {
    sfield: DeepOptional;

    init() {
        self.sfield = DeepOptional{
            inner: null
        };
    }
}