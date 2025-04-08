struct X {
    text: String?;
}

struct Wrapper {
    inner: X;
}

contract TestEmbeddedOptionalStr {
    w: Wrapper;

    init() {
        self.w = Wrapper{ inner: X{ text: null } };
    }
}