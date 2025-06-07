struct Wrap {
    f: Int;
}

contract OptionalWrapper {
    w: Wrap?;

    init() {
        self.w = Wrap{ f: 42 };
    }
}
