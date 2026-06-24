struct InnerMost { f: Bool; }

struct DeepOpt {
    inner: InnerMost?;
}

contract OptNested {
    s: DeepOpt;

    init() {
        self.s = DeepOpt{ inner: null };
    }
}