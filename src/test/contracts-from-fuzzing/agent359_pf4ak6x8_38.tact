struct Wrapper {
    a: Int;
    nestedOpt: Nested?;
}

struct Nested {
    b: Int;
    innerOpt: Inner?;
}

struct Inner {
    c: Int;
}

contract NestedOptionChains {
    val: Wrapper;
    init() {
        self.val = Wrapper{
            a:1,
            nestedOpt:null
        };
    }
}