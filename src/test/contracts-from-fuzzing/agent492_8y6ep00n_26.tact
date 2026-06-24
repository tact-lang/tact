struct Inner {
    i: Int;
}

contract Foo {
    optInner: Inner?;
    n: Int;

    init() {
        self.optInner = null;
        self.n = 0;
    }

    receive() {
        self.optInner = Inner{i: 5};
        self.n = self.optInner!!.i;
    }
}