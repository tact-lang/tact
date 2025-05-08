struct InnerOpt {
    a: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptOptStruct {
    f: OuterOpt?;
    init() {
        self.f = null;
    }
    receive() {
        if (self.f != null) {
            let _ = self.f!!;
        }
    }
}