struct NestedOptionals {
    optInner: Inner?;
    optFlag: Bool?;
}

struct Inner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    nestedOpt: NestedOptionals;

    init() {
        self.nestedOpt = NestedOptionals{
            optInner: null,
            optFlag: null
        };
    }

    receive() {
        if (self.nestedOpt.optInner != null) {
            let _ = self.nestedOpt.optInner!!.foo;
        }
    }
}