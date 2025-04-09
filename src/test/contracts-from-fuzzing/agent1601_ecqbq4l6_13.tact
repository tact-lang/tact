struct Inception {
    nested: InnerOption?;
}

struct InnerOption {
    x: Int;
    y: String?;
}

contract OptionPartial {
    f: Inception;
    init() {
        self.f = Inception{ nested: null };
    }
}