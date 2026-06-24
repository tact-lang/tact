struct InnerMost {
    aa: Int; bb: Int?;
}
struct Inner {
    im: InnerMost; c: Bool; d: Bool?;
}

contract InlineNested {
    nested: Inner;
    init() {
        self.nested = Inner{
            im: InnerMost{ aa:1, bb:null },
            c: true, d: null
        };
    }
}