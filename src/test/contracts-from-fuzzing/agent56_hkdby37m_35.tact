struct NestOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
}

contract NullInNull {
    nm: NestOpt;

    init() {
        self.nm = NestOpt{ inner:null };
    }
}