struct InnerMost {
    foo: Int;
}

struct Inner {
    bar: Bool;
    nested: InnerMost;
}

contract TestContract {
    val: Inner;

    init() {
        self.val = Inner{bar:true, nested:InnerMost{foo:42}};
    }
}