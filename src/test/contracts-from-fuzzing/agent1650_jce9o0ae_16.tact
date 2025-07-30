struct InnerOpt {
    foo: Bool?;
}

struct NestOpt {
    inner: InnerOpt?;
}

contract OptOptField {
    val: NestOpt;

    init() {
        self.val = NestOpt{inner:null};
    }
}