struct InnerMost { s: String }
struct InnerOpt { inner: InnerMost? }
struct Middle { innerOpt: InnerOpt }

contract NullDeepNest {
    store: Middle;

    init() {
        self.store = Middle{
            innerOpt: InnerOpt{ inner: null }
        };
    }
}
