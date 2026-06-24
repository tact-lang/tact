struct NestOpt {
    inner: Int?;
}

struct OuterOpt {
    nested: NestOpt?;
}

contract OptDeep {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{ nested: null };
    }
}