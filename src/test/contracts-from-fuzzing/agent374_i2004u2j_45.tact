struct Deepest {
    foo: Int?;
}

struct InnerOptional {
    deep: Deepest?;
}

struct Top {
    inner: InnerOptional?;
}

contract OptInOptOpt {
    top: Top;

    init() {
        self.top = Top{inner:null};
    }

    receive() {
        if (self.top.inner != null && self.top.inner!!.deep != null && self.top.inner!!.deep!!.foo != null) {
            let _ = self.top.inner!!.deep!!.foo!!;
        }
    }
}