contract TestContract {
    optOpt: Inner?;

    init() {
        self.optOpt = null;
    }
}

struct Inner {
    v: Int?;
}