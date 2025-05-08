struct StrWithOpt {
    a: Int;
    b: Int?;
}

contract AssignPartialStruct {
    s: StrWithOpt;

    init() {
        self.s = StrWithOpt{ a: 1, b: null };
    }
}