struct OneOpt {
    o: Int?;
}

struct Wrap {
    inner: OneOpt?;
}

contract OptionalOptional {
    s: Wrap;
    init() {
        self.s = Wrap{ inner: null };
    }
    receive() {}
}