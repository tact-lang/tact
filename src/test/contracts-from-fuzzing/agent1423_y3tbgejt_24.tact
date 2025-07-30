struct CompositeDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "xyz";
}

contract DefaultedComposite {
    s: CompositeDefault;
    init() {
        self.s = CompositeDefault{};
    }
}