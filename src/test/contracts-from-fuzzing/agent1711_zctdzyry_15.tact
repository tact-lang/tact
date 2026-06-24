struct NMutOpt {
    f1: Int;
    f2: Bool?;
    f3: Int;
    f4: Bool?;
    f5: Int;
}

contract TestMixOptional {
    s: NMutOpt;

    init() {
        self.s = NMutOpt{
            f1: 1,
            f2: null,
            f3: 3,
            f4: null,
            f5: 5
        };
    }
}