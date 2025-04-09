struct InnerMost {
    v: Int;
}

struct InnerMid {
    im: InnerMost;
}

struct Inner {
    imid: InnerMid;
}

contract DeepContainer {
    s: Inner;

    init() {
        self.s = Inner{
            imid: InnerMid{
                im: InnerMost{ v: 42 }
            }
        };
    }
}