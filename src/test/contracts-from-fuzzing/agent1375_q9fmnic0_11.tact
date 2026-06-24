struct Params {
    s: String?;
    i: Int;
}

contract OptionalAndNonOptional {
    p: Params;

    init() {
        self.p = Params{ s: null, i: 99 };
    }
}