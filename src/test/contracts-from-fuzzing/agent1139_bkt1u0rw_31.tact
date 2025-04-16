struct OptPrim {
    a: Int?;
    b: Bool?;
}

struct NestOpt {
    val: OptPrim?;
}

contract ComboOptional {
    inner: NestOpt?;

    init() {
        self.inner = null;
    }
}