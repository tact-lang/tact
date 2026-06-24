struct InnerOptional {
    a: Int?;
}

struct MidOptional {
    b: InnerOptional?;
}

contract OptionalStructInStruct {
    s: MidOptional;

    init() {
        self.s = MidOptional { b: null };
    }
}