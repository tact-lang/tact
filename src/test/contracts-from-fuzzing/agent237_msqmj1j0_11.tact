struct InnerStringOpt {
    s: String?;
}

struct Container {
    inner: InnerStringOpt;
}

contract OptStringHolder {
    c: Container;
    init() {
        self.c = Container{inner: InnerStringOpt{s: null}};
    }
}