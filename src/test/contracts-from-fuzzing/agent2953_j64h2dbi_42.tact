struct Inside {
    i: Int;
    b: Bool;
}

contract JustStructPersistent {
    s: Inside;

    init() {
        self.s = Inside{
            i: 7,
            b: true
        };
    }
}