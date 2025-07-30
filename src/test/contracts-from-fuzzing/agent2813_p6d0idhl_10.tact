struct ComposeDefault {
    inner: InnerDefault;
}

struct InnerDefault {
    a: Int = 17;
    b: Bool = true;
}

contract TestComposeDefaults {
    dat: ComposeDefault;

    init() {
        self.dat = ComposeDefault{
            inner: InnerDefault{}
        };
    }
}
