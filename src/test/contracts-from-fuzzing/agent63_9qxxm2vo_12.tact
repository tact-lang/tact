struct Inside {
    small: Int as uint4;
}

contract OptionalSerialized {
    opt: Inside?;

    init() {
        self.opt = Inside{ small: 7 };
    }
}