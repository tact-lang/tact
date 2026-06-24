struct Sub {
    q: Int;
    r: Bool;
}

contract InlineDefaults {
    s: Sub = Sub{ q: 10, r: false };

    init() {
        self.s = Sub{ q: 42, r: true };
    }
}