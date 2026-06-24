// Optional with nested struct with defaults
struct Inner {
    foo: Int = 42;
    bar: Bool = false;
}

struct OuterOpt {
    innerOpt: Inner?;
}

contract TestContract {
    oo: OuterOpt;

    init() {
        self.oo = OuterOpt{ innerOpt: null };
    }

    receive() {
        if (self.oo.innerOpt != null) {
            let _ = self.oo.innerOpt!!.foo;
        }
    }
}