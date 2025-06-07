struct DeepOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    s: String?;
}

contract TestContract {
    stuff: DeepOpt;

    init() {
        self.stuff = DeepOpt {
            inner: InnerOpt { s: null }
        };
    }

    receive() {
        if (self.stuff.inner != null) {
            let s = self.stuff.inner!!.s;
            if (s != null) { dump(s!!); }
        }
    }
}
