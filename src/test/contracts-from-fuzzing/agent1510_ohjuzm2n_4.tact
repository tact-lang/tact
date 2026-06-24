struct InnerMost {
    val: Int;
    flag: Bool = true;
}

struct Inner {
    im: InnerMost;
    opt: Int?;
}

struct Outer {
    inner: Inner;
    outerFlag: Bool = false;
}

contract TestContract {
    persist: Outer = Outer{inner: Inner{im: InnerMost{val: 7, flag: true}, opt: null}, outerFlag: false};

    init() {
        self.persist = Outer{inner: Inner{im: InnerMost{val: 1, flag: false}, opt: null}, outerFlag: true};
    }

    receive() {
        let _ = self.persist;
    }
}