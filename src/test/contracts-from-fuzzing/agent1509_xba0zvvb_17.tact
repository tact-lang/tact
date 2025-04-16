struct NestedOption {
    a: Int?;
    b: Bool?;
}

struct OptionInside {
    inner: NestedOption?;
}

contract OptInOpt {
    data: OptionInside;
    init() {
        self.data = OptionInside{
            inner: NestedOption{ a: null, b: null }
        };
    }
    receive() {
        if (self.data.inner != null) {
            let _ = self.data.inner!!.a;
        }
    }
}