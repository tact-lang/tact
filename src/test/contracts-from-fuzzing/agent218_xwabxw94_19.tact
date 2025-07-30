struct DeepInner {
    s: String;
}

struct Wrapper {
    inner: DeepInner;
}

contract UnicodeNested {
    w: Wrapper;

    init() {
        self.w = Wrapper{ inner: DeepInner{ s: "こんにちは" } };
    }
}