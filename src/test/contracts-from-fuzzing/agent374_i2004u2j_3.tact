struct DeepOptional {
    maybeInner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    deepOpt: DeepOptional;

    init() {
        self.deepOpt = DeepOptional{maybeInner: null};
    }

    receive() {
        if (self.deepOpt.maybeInner != null) {
            let _ = self.deepOpt.maybeInner!!.foo;
        }
    }
}