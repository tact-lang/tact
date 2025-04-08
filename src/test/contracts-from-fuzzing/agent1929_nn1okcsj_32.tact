struct MixNestedOptional {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalMixDeep {
    o1: MixNestedOptional?;
    init() {
        self.o1 = MixNestedOptional{i: null, b: true, s: null};
    }
}