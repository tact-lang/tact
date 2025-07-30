struct SkipDefault {
    a: Int;
    b: Bool = true;
}

contract UseSkipDefault {
    s: SkipDefault;

    init() {
        self.s = SkipDefault{
            a: 42,
        };
    }
}