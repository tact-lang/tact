struct InnerOpt {
    a: Int?;
    s: String?;
}

struct Complex {
    i: Int;
    b: Bool;
    inner: InnerOpt;
    innerOpt: InnerOpt?;
}

contract OptFields {
    data: Complex;

    init() {
        self.data = Complex{
            i: 7,
            b: true,
            inner: InnerOpt{ a:null, s:null },
            innerOpt: null
        };
    }
}