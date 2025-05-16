struct EmbedBool {
    flag: Bool;
}

contract DefaultComposeOpt {
    foo: EmbedBool?;
    init() {
        self.foo = null;
    }
}
