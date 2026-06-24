struct DefaultOptNested {
    x: Int? = null;
    y: Bool? = null;
}

contract NestedDefaultOpt {
    a: DefaultOptNested;

    init() {
        self.a = DefaultOptNested{};
    }
}