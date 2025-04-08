struct InnerMost {
    val: Int as uint4;   // 4 bits only
    flag: Bool = false;
}

struct Inner {
    im: InnerMost;
    opt: Int?;
}

struct Outer {
    inner: Inner;
    bigVal: Int as int128;  // explicit signed 128 bits
}

contract TestContract {
    persist: Outer = Outer{inner: Inner{im: InnerMost{val: 7, flag: true}, opt: null}, bigVal: 0};

    init() {
        self.persist = Outer{inner: Inner{im: InnerMost{val: 15, flag: false}, opt: null}, bigVal: -123456789};
    }

    receive() {
        let _ = self.persist;
    }
}