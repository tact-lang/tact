struct HasOptInner {
    foo: Int;
    bar: Inner?;
}

struct Inner {
    baz: Int;
}

contract OptInnerCont {
    val: HasOptInner;

    init() {
        self.val = HasOptInner{
            foo: 10,
            bar: null,
        };
    }
}