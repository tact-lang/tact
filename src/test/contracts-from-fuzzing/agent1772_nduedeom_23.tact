struct Inner { n: Int }

struct HasOpt {
    inner: Inner?;
}

contract OptStructInContract {
    var1: HasOpt;

    init() {
        self.var1 = HasOpt{ inner: null };
    }
}