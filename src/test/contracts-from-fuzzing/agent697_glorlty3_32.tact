struct Embedded {
    s: String;
    b: Bool?;
}

contract EmbeddedStructOpt {
    inner: Embedded?;

    init() {
        self.inner = null;
    }
}