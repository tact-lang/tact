struct Wrap1 { inner: Int; }
struct Wrap2 { nested: Wrap1; }
struct Wrap3 { deeper: Wrap2; }
struct Wrap4 { layer: Wrap3; }

contract DeepWrap {
    w: Wrap4;

    init() {
        self.w = Wrap4 { layer: Wrap3 { deeper: Wrap2 { nested: Wrap1 { inner: 42 } } } };
    }
}
