struct DefaultOpts {
    a: Int? = null;
    b: Int? = null;
}

contract DefOptStructs {
    inner: DefaultOpts;

    init() {
        self.inner = DefaultOpts{};
    }
}