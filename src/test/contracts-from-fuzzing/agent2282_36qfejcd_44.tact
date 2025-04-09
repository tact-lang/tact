struct NestOpt {
    a: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    b: Int?;
}

contract Test40 {
    s: NestOpt;
    init() {
        self.s = NestOpt{ a:null, inner:InnerOpt{ b:null } };
    }
}